---
layout: default
title: "Unix Command Line Interface: Large File Uploads"
permalink: /cli/unix/articles/large
product: unix-cli
categories: cli linux unix
tags: large file upload download
---
#UNIX CLI: Large File Uploads#

The Unix CLI is the perfect way to upload large files.  This article contains some tuning and recovery tips for uploading large files.

If you upload files larger than 5 gigabytes with the Unix CLI, they will be segmented into 1 gigabyte segments and a manifest file will be created to paste the segments back together.  Use the manifests file as you would any object and do not remove the segments.

* [Tuning](#Tuning)
* [Restarting an Upload](#Restarting)

##Tuning## {#Tuning}

There are three configuration settings that may need tuning if you are uploading or downloading large files.  These settings are:

* read_timeout : The timeout in seconds to complete a read (default 240 seconds)
* write_timeout : The timeout in seconds to complete a write (default 240 seconds)
* storage_segment_size : The size in bytes of each segment uploaded (default one gigabyte)
* storage_chunk_size : The size in bytes of chunks to write when uploading (default one megabyte)
* storage_max_size : The maximum size of a file before it needs a manifest (default five gigabytes)

Older versions of the CLI used a fairly low value for read and write time outs, so you may want to set that if you configuration files have been around a while.  If you are on an unreliable connection, you may wish to set the segment size smaller so you can have a better chance of getting a segment uploaded.  The segment size works only for uploads.  A segment size larger than five gigabytes will fail.

If storage_chunk_size is set too large, you may receive a "Broken Pipe" error message because the large chunk fails to write.  In performance tests that we have run, there has not been much difference with different values of chunk size.

##Restarting an Upload## {#Restarting}

If a large file upload fails for any reason, you may retry it.  First you will need to clean up any partial segments:

    $  hpcloud list :databases -l
      +-------------------------------+------------+--...
      | sname                         | size       | t...
      +-------------------------------+------------+--...
      | ten_gig.db.segment.0000000001 | 1073741824 | a...
      | ten_gig.db.segment.0000000002 | 1073741824 | a...
      | ten_gig.db.segment.0000000003 | 4202023    | a...
      +-------------------------------+------------+--...

Remove the partial segment:

    $ hpcloud remove :databases/ten_gig.db.segment.0000000003
    Removed :databases/ten_gig.db.segment.0000000003

And retry with the -r option:

    $ hpcloud copy -r ten_gig.db :databases
    ten_gig.db: |====================================================|
    Copied ten_gig.db => :databases
    $
