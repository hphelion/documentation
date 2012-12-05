---
layout: default
title: "HP Cloud Fog Binding Object Storage Examples"
permalink: /bindings/fog/object-storage/
product: fog

---
The HP Cloud services provides object storage support via both the model abstraction and the request abstraction.  Executing commands in both layers are detailed
in this page. 

<!--ACLs in separate section-->

The examples on this page can be executed from within a Ruby console (IRB):

        irb

This page discusses the following topics:

* [Connecting to the Service](#ConnectingtotheService)
* [Using the Model Abstraction](#UsingtheModelAbstraction)
* [Using the Request Abstraction](#UsingtheRequestAbstraction)

##Connecting to the Service## {#ConnectingtotheService}

For information on connecting to the service, please see the [Connecting to the HP Cloud Service](/bindings/fog/connect) page.

##Using the Model Abstraction## {#UsingtheModelAbstraction}

1. List all directories/containers for the given account

        dirs = conn.directories
        dirs.size   # returns no. of directories

2. Create a new directory/container

        conn.directories.create(:key => "fog-rocks")

3. View a directory/container

        dir = conn.directories.get("fog-rocks")
        dir.key    # => fog-rocks

4. Apply ACLs on an existing directory/container

        dir = conn.directories.get("fog-rocks")
        dir.public = true
        dir.save
        dir.public?               # => true
        dir.public = false        # toggles between "private" and "public-read" acl on a directory
        dir.save
        dir.public?               # => false


5. Create a new file/object into an existing directory/container

        dir = conn.directories.get("fog-rocks")
        dir.files.create(:key => "sample.txt", :body => File.open("/path/to/sample.txt"))

6. View a file/object from an existing directory/container

        dir = conn.directories.get("fog-rocks")
        file = dir.files.get("sample.txt")
        file.key   # => sample.txt

7. Copy a file/object into an existing directory/container

        file = conn.directories.get("fog-rocks").files.get("sample.txt")
        other_file = file.copy("fog-rocks", "another-sample.txt")
        other_file.key   # => another-sample.txt

8. View the files/objects for a directory/container

        dir = conn.directories.get("fog-rocks")
        files = dir.files
        files.directory.key      # => fog-rocks
        files.size               # returns no. of files
        files[0].key             # key of the file in collection
        files[0].content_length  # content length of file
        files[0].last_modified   # last modified date in UTC

9. Generate a temporary URL for a file or object for sharing purposes

        dir = conn.directories.get("fog-rocks")
        file = dir.files.get("sample.txt")
        # creates a TempUrl to access sample.txt and access expires in 240 secs
        file.temp_signed_url(240, "GET")

10. Delete a file/object from an existing directory/container

        dir = conn.directories.get("fog-rocks")
        file = dir.files.get("sample.txt")
        file.destroy
        # chaining a series of calls to delete a file
        conn.directories.get("fog-rocks").files.get("another-sample.txt").destroy

11. Delete an existing directory/container

        # Note: directory needs to be empty before it can be deleted!
        conn.directories.get("fog-rocks").destroy

**Note**: You cannot use the create, update, or delete operations on a shared container.

###Using Object ACLs### {#UsingObjectACLsModelLayer}

Object ACLs allow you to share containers and objects with other registered HP Cloud Services users.  The owner of a container or object can grant read, write, read/write access to other users.  The shared containers and objects can then be accessed based on the permissions granted by the owner.

To grant access to an object or container:

    mydir = conn.directories.get('rgtest2')  # Note: grant uses username. in my case it is email as my username is email address
    mydir.grant("rw", ["rupakg+fog2@gmail.com"])
    mydir.save                               # share the url for access to container
    mydir.public_url
     => "https://objects.rndd.aw1.hpcloud.net:443/v1/91545177658759/rgtest2"
     
    myfile = mydir.files.get("sample.txt")   # share the url for access to object
    myfile.public_url
     => "https://objects.rndd.aw1.hpcloud.net:443/v1/91545177658759/rgtest2/sample.txt"
     
1. Use the shared URLs to get the contents of a shared container:

        sd = conn2.shared_directories.get(mydir.public_url)
         =>   Fog::Storage::HP::SharedDirectory
             url"https://objects.rndd.aw1.hpcloud.net:443/v1/91545177658759/rgtest2",
             bytes"54",
             count"2"
             
        sd.url
         => "https://objects.rndd.aw1.hpcloud.net:443/v1/91545177658759/rgtest2"
         
        sd.files
         =>   Fog::Storage::HP::SharedFiles
             shared_directory => Fog::Storage::HP::SharedDirectory
             url"https://objects.rndd.aw1.hpcloud.net:443/v1/91545177658759/rgtest2",
             bytes"54",
             count"2"
        
        [
         Fog::Storage::HP::SharedFile
           url"https://objects.rndd.aw1.hpcloud.net:443/v1/91545177658759/rgtest2/sample.txt",
           key"sample.txt",
           content_length29,
           content_type"application/json",
           etag"c130cf926a1da34a4bf559fc40d9e220",
           last_modified2012-10-18 18:59:45 -0400
         ,
         Fog::Storage::HP::SharedFile
           url"https://objects.rndd.aw1.hpcloud.net:443/v1/91545177658759/rgtest2/tiny.txt",
           key"tiny.txt",
           content_length25,
           content_type"application/json",
           etag"3381727858d3d66dacb7dbb24577b2d0",
           last_modified2012-10-18 18:52:15 -0400
           
         ]
    
  **Note**: If the grantee does not have access, the system generates an exception of type `Fog::HP::Errors::Forbidden`.
        
2. Use the shared URLs to get the metadata for a container:

        sd = conn2.shared_directories.head(mydir.public_url)
          =>   Fog::Storage::HP::SharedDirectory
              url"https://objects.rndd.aw1.hpcloud.net:443/v1/91545177658759/rgtest2",
              bytes"54",
              count"2"
    
  **Note**: If the grantee does not have access, the system generates an exception of type `Fog::HP::Errors::Forbidden`.

3. Use the shared URLs to get the contents of a shared object:

        sd = conn2.shared_directories.get(mydir.public_url)
        sf = sd.files.get('sample.txt')
        
4. Use the shared URLs to get the metadata for a shared object

        sd = conn2.shared_directories.get(mydir.public_url)
        sf = sd.files.head('sample.txt')
        
5. Use the shared URLs to put a new object or file into a shared container:

        sd = conn2.shared_directories.get(mydir.public_url)
        sf = sd.files.create(:key => 'tiny2.txt', :body => "This is another text file.")
        
  **Note**: If the grantee does not have access, the system generates an exception of type `Fog::HP::Errors::Forbidden`.
        
6. Use the shared URLs to update an existing object or file in a shared container:

        sd = conn2.shared_directories.get(mydir.public_url)
        sf = sd.files.new(:key => 'sample.txt')
        sf.body = "This is another text file."
        sf.save
        
  **Note**: If the grantee does not have access, the system generates an exception of type `Fog::HP::Errors::Forbidden`.
        
7. Use the shared URLs to delete an existing object or file from a shared container:

        sd = conn2.shared_directories.get(mydir.public_url)
        sd.destroy

##Using the Request Abstraction## {#UsingtheRequestAbstraction}

1. List all container for the given account

        response = conn.get_containers
        response.body               # returns an array of container hash objects
        response.body[0]["name"]    # returns the name of the container
        response.body[0]["count"]   # returns the number of objects in the container
        response.body[0]["bytes"]   # returns the total bytes for the objects in the container

2. Create a new container

        container = conn.put_container("fog-rocks")   # creates the container
        container.headers                             # returns a hash of headers
        container.headers["Content-Length"]           # returns the content-length

3. View a container

        container = conn.get_container("fog-rocks")
        container.body                                # returns an array of objects hash
        container.body[0]['name']                     # returns the name of the object
        container.headers                             # returns a hash of headers
        container.headers["Content-Length"]           # returns the content-length
        container.headers["Content-Type"]             # returns the content-type
        container.headers["X-Container-Object-Count"] # returns the number of objects in the container
        container.headers["X-Container-Bytes-Used"]   # returns the total bytes for the objects in the container
        container.status                              # HTTP status code for the operation

4. View the container's headers and metadata without getting the content

        container = conn.head_container("fog-rocks")
        container.body                             # returns an empty body
        container.headers                          # returns a hash of headers
        container.headers["Content-Length"]        # returns the content-length
        container.headers["Content-Type"]          # returns the content-type
        container.status                           # HTTP status code for the operation

5. Create a new file into an existing container

        file = conn.put_object("fog-rocks","sample.txt",File.open('/path/to/file/sample.txt'))
        file.headers                            # returns a hash of headers
        file.headers["Content-Length"]          # returns the content-length

6. View a file from an existing container

        file = conn.get_object("fog-rocks", "sample.txt")
        file.body                               # returns the contents of the file
        file.headers                            # returns a hash of headers
        file.headers["Content-Length"]          # returns the content-length
        file.headers["Content-Type"]            # returns the content-type
        file.status                             # HTTP status code for the operation

7. View the file's headers and metadata without getting the content

        file = conn.head_object("fog-rocks", "sample.txt")
        file.body                               # returns the empty body
        file.headers                            # returns a hash of headers
        file.headers["Content-Length"]          # returns the content-length
        file.headers["Content-Type"]            # returns the content-type
        file.status                             # HTTP status code for the operation

8. Copy a file within the same container

        # copy an object
        conn.put_object("fog-rocks", "another-sample.txt", nil, {'X-Copy-From' => "/fog-rocks/sample.txt" })
        # get the copied object
        other_file = conn.get_object("fog-rocks", "another-sample.txt")
        other_file.headers                            # returns a hash of headers
        other_file.headers["Content-Length"]          # returns the content-length

9. Copy a file from one container to another container

        # create a new container
        conn.put_container("fog-rocks-2")             # creates the other new container
        # copy the object
        conn.put_object("fog-rocks-2", "sample.txt", nil, {'X-Copy-From' => "/fog-rocks/sample.txt" })
        # get the copied object
        other_file = conn.get_object("fog-rocks-2", "sample.txt")
        other_file.headers                            # returns a hash of headers
        other_file.headers["Content-Length"]          # returns the content-length

10. Generate a temporary URL for a file or object for sharing purposes

        # creates a TempUrl to access sample.txt and access expires in 240 secs
        conn.get_object_temp_url("fog-rocks", "sample.txt", 240, "GET")
        
11. Delete a file from an existing container

        conn.delete_object("fog-rocks", "sample.txt")
        conn.delete_object("fog-rocks", "another-sample.txt")

12. Delete an existing container

        # Note: a container needs to be empty before it can be deleted!
        conn.delete_container("fog-rocks")
        
###Using Object ACLs### {#UsingObjectACLsRequestLayer}

To use object ACLs in the request abstraction layer, you need to have already been granted permission to access the objects or containers.  (See the section on [Using Object ACLs](#UsingObjectACLsModelLayer) in the Model Layer section above for information on granting access.)

1. Use the shared URLs to get the contents of a shared container: 

        conn2.get_shared_container(mydir.public_url)
         => #<Excon::Response:0x007fb03410d718 @body=[{"name"=>"sample.txt",                         
           "hash"=>"a1fc87ae17cb8b1bce85cb6faa3bdf90", 
           "bytes"=>23, "content_type"=>"text/plain", 
           "last_modified"=>"2012-10-11T17:57:44.751930"}], 
           headers{"X-Container-Object-Count"=>"1", 
           "X-Container-Bytes-Used"=>"23", 
           "Accept-Ranges"=>"bytes", 
           "Content-Length"=>"150", 
           "Content-Type"=>"application/json; charset=utf-8", 
           "X-Trans-Id"=>"tx49b6c8e9078d4f62b8ccc61b781dd975", 
           "Date"=>"Wed, 17 Oct 2012 17:28:29 GMT"}, 
           status200

  **Note**: If the grantee does not have access, the system generates an exception of type `Fog::HP::Errors::Forbidden`.

2. Use the shared URLs to get the metadate of a shared container:

        conn2.head_shared_container(mydir.public_url)
         => #<Excon::Response:0x007fb0339e6070 @body="", 
           @headers={"X-Container-Object-Count"=>"1", 
           "X-Container-Bytes-Used"=>"23", 
           "Accept-Ranges"=>"bytes", 
           "Content-Length"=>"0", 
           "X-Trans-Id"=>"tx61278cc1833d40eab8504f671b244634", 
           "Date"=>"Wed, 17 Oct 2012 17:38:47 GMT"}, 
           status204

  **Note**: If the grantee does not have access, the system generates an exception of type `Fog::HP::Errors::Forbidden`.
  
3. Use the shared URLs to get the contents of a shared object:

        conn2.get_shared_object(myfile.public_url)
         => #<Excon::Response:0x007fb033b029e0 @body="This is a sample text.\n",
           @headers={"Last-Modified"=>"Thu, 11 Oct 2012 17:57:44 GMT",
           "Etag"=>"a1fc87ae17cb8b1bce85cb6faa3bdf90", 
           "Accept-Ranges"=>"bytes", 
           "Content-Length"=>"23", 
           "Content-Type"=>"text/plain", 
           "X-Trans-Id"=>"tx45a301288c044a48b0b18bed5c8d209d", 
           "Date"=>"Wed, 17 Oct 2012 17:28:45 GMT"}, 
           status200
        
4. Use the shared URLs to get the metadata for a shared object

        conn2.head_shared_object(myfile.public_url)
         => #<Excon::Response:0x007fb0338c7e00 @body="", 
           @headers={"Last-Modified"=>"Thu, 11 Oct 2012 17:57:44 GMT",
           "Etag"=>"a1fc87ae17cb8b1bce85cb6faa3bdf90", 
           "Accept-Ranges"=>"bytes", 
           "Content-Length"=>"23", 
           "Content-Type"=>"text/plain", 
           "X-Trans-Id"=>"tx453169d179494a289023127e1b84888c", 
           "Date"=>"Wed, 17 Oct 2012 17:39:23 GMT"}, 
           status200
        
5. Use the shared URLs to put a new object or file into a shared container:

        conn2.put_shared_object(mydir.public_url, 'tiny.txt', File.read('tiny.txt'))
         => #<Excon::Response:0x007fd51d979380 @body="201 Created\n\n\n\n   ",
           @headers={"Content-Length"=>"18", "Content-Type"=>"text/html; charset=UTF-8",
           "Etag"=>"3381727858d3d66dacb7dbb24577b2d0", 
           "Last-Modified"=>"Thu, 18 Oct 2012 18:52:15 GMT", 
           "X-Trans-Id"=>"tx0848eb7c715442b89d27c6b9337bb0b2", 
           "Date"=>"Thu, 18 Oct 2012 18:52:15 GMT"}, 
           status201
        
  **Note**: If the grantee does not have access, the system generates an exception of type `Fog::HP::Errors::Forbidden`.
        
6. Use the shared URLs to update an existing object or file in a shared container:

        conn2.put_shared_object(mydir.public_url, 'sample.txt', "This text needed some update.")
         => #<Excon::Response:0x007fd51ba2a588 @body="201 Created\n\n\n\n   ",
           @headers={"Content-Length"=>"18", 
           "Content-Type"=>"text/html; charset=UTF-8", 
           "Etag"=>"c130cf926a1da34a4bf559fc40d9e220", 
           "Last-Modified"=>"Thu, 18 Oct 2012 18:59:45 GMT", 
           "X-Trans-Id"=>"tx759cacf63dca47088d6243f2d4b7c311", 
           "Date"=>"Thu, 18 Oct 2012 18:59:45 GMT"}, s
           tatus201
        
  **Note**: If the grantee does not have access, the system generates an exception of type `Fog::HP::Errors::Forbidden`.
        
7. Use the shared URLs to delete an existing object or file from a shared container:

        conn2.delete_shared_object(myfile.public_url)
         => #<Excon::Response:0x007ffe1452e5d0 @body="", 
           @headers={"Content-Length"=>"0", 
           "Content-Type"=>"text/html; charset=UTF-8", 
           "X-Trans-Id"=>"txb452f6f2761447e6ba54eec3373164a5", 
           "Date"=>"Wed, 31 Oct 2012 15:02:44 GMT"}, 
           status204
