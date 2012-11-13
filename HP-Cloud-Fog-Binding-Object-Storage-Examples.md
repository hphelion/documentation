---
layout: default
title: "HP Cloud Fog Binding Object Storage Examples"
permalink: /bindings/fog/object-storage/

---
# HP Cloud Fog Binding Object Storage Examples

The HP Cloud services provides object storage support via both the model abstraction and the request abstraction.  Executing commands in both layers are detailed
in this page. 

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