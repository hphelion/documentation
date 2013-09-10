---
layout: default
title: "HP Cloud Services Ruby Fog Block Storage Examples"
permalink: /v13/bindings/fog/block-storage/
product: fog

---
#Ruby Fog Bindings Block Storage Examples

HP Cloud services block storage provides support for volumes and snapshots. A volume can store boot images, user data or both. They provide customers with persistent and flexible permanent storage. You can think of it as list of USB devices, that can be plugged in anywhere at will. Volumes can be attached to server instances and mounted. 

Snapshots are saved volume images at specific moments in time. You can take a snapshot of a volume and then use that snapshot to create a new volume.

The block storage provider has two abstractions - [a model layer](#ModelLayer) and [a request layer](#RequestLayer). Both layers are detailed below. The following code snippets can be executed from within a Ruby console (IRB):

        irb

This page discusses the following tasks:

* [Connecting to the Service](#ConnectingtotheService)
* [Volume Operations (Model Layer)](#ModelVolumeOperations)
* [Snapshot Operations (Model Layer)](#ModelSnapshotOperations)
* [Volume Operations (Request Layer)](#RequestVolumeOperations)
* [Snapshot Operations (Request Layer)](#RequestSnapshotOperations)

##Connecting to the Service## {#ConnectingtotheService}

To connect to the HP Cloud Block Storage Service, follow these steps:

1. Enter IRB

        irb

2. Require the Fog library

        require 'fog'

3. Establish a connection to the HP Cloud BlockStorage service

        conn = Fog::HP::BlockStorageV2.new(
               :hp_access_key  => "<your_ACCESS_KEY>",
               :hp_secret_key => "<your_SECRET_KEY>",
               :hp_auth_uri   => "<IDENTITY_ENDPOINT_URL>",
               :hp_tenant_id => "<your_TENANT_ID>",
               :hp_avl_zone => "<your_AVAILABILITY_ZONE>",
               <other optional parameters>
               )

**Note**: You must use the `:hp_access_key` parameter rather than the now-deprecated  `:hp_account_id` parameter you might have used in previous Ruby Fog versions.

You can find the values the access key, secret key, and other values by clicking the [`API Keys`](https://console.hpcloud.com/account/api_keys) button in the [Console Dashboard](https://console.hpcloud.com/dashboard).

##Using the Model Abstraction## {#ModelLayer}

<!--A description of what the model abstraction *is* would be good here-->

This section discusses the various operations you can perform using the model abstraction:

* [Volume Operations](#ModelVolumeOperations)
* [Snapshot Operations](#ModelSnapshotOperations)
* [Volume Backup Operations] (#ModelVolBackupOperations)

###Volume Operations (Model Layer)### {#ModelVolumeOperations}

This section discusses the volume operations you can perform using the model abstraction.

1. List all available volumes for an account:

        conn.volumes
        volumes.size   # returns no. of volumes
        # display volumes in a tabular format
        volumes.table([:id, :name, :status, :created_at])

2. Obtain the details of a volume by the volume ID:

        conn.volumes.get("volume_id")
        volume.name                         # returns name of the volume
        volume.created_at                   # returns the date the volume was created
        volume.status                       # returns the state of the volume e.g. available, in-use

3. List volume details using a filter:

        conn.volumes.all(:status => 'error')

4. Create a volume

        new_volume = conn.volumes.create(
               :name => "TestVolume",
               :description => "My Test Volume",
               :size => 1)
        new_volume.id       # returns the id of the volume
        new_volume.name     # => "TestVolume"
        new_volume.status    # returns the status of the volume e.g., creating, available

5. Create a new bootable volume from an suitable single-part image

        new_volume = conn.bootable_volumes.create(
               :name => "BootVolume",
               :description => "My Boot Volume",
               :image_id => 11111,
               :size => 10)
        new_volume.id       # returns the id of the volume
**Note**: You can use a bootable volume to create a persistent server instance.

6. Create a volume from a volume snapshot:

        new_volume = conn.volumes.create(
                :name => 'SnapVolume', 
                :source_volid => "source_volid")
**Note**: The size of the volume you create from an image is the same as that of the image. The `:size` parameter has no effect in this case.

7. Attach a volume to a server:

        s.volume_attachments.create(
                :server_id => s.id, 
                :volume_id => "volume_id", 
                :device => "/dev/sdf")
        # => true
**Note**: The device parameter is the mount point on the server instance to which the volume is attached (for example, `/dev/sdf`).

8. List the attached volumes for a server:

        s = conn.servers.get("server_id")
        s.volume_attachments.all

9. Detach a volume from a server:

        s = conn.servers.get("server_id")
        att.destroy
        # => true

10. Update a volume:

        volume = conn.volumes.get("volume_id")
        vol.description = "from a source vol. in a diff. availability zone"
        => "from a source vol. in a diff. availability zone"
        vol.save
        => true
        vol.reload

11. Delete a volume:

        volume = conn.delete_volume(volume_id)
        volume.destroy
        # => true

###Snapshot Operations (Model Layer)### {#ModelSnapshotOperations}

This section discusses the snapshot operations you can perform using the model abstraction.

1. List all available snapshots for an account:

        conn.snapshots
        snapshots.size   # returns no. of snapshots
        # display snapshots in a tabular format
        conn.snapshots.table([:id, :name, :state, :created_at])

2. List snapshots using a filter:

        conn.snapshots.all(:limit => 2)

3. Obtain the details of a snapshot using the name:

        snapshot = conn.snapshots.all(:display_name => 'My Snapshot')
        name            # returns name of the snapshot
        description     # returns the description of the snapshot           
        created_at      # returns the date the snapshot was created
        status          # returns the state of the snapshot e.g., available

4. Obtain the details of a snapshot by the ID:

        conn.snapshots.get("Snapshot_id")
        name            # returns name of the volume
        description     # returns the description of the snapshot           
        status          # returns the state of the snapshot e.g., available
        created_at      # returns the date the snapshot was created
        volume_id       # returns the volume ID

5. Create a snapshot:

        conn.snapshots.create(
               :volume_id => "volume_id",
               :name => "TestVolume",
               :description => "My Test Volume",

        snapshot.id     # returns the id of the volume
        name            # => "TestVolume"
        description     # returns the description of the snapshot
        status          # returns the status of the volume e.g., creating, available
        created_at      # returns the date the snapshot was created
        volume_id       # => 1

6. Update a snapshot

        snapshot = conn.snapshots.get("snapshot_id")
        snap.name = "Snapshot 1"
        snap.save
        => true
        snap.reload

7. Delete an existing snapshot

        conn.snapshots.get("snapshot_id").destroy
        => true

###Volume Backup Operations (Model Layer)### {#ModelVolBackupOperations}

This section discusses the volume backup operations you can perform using the model abstraction.

1. List available volume backups for an account:

        conn.volume_backups

2. List details of volume backups:

        conn.volume_backups.all(:details => true)
        
        name    # returns the name of the volume backup
        status  # provides the status of the volume backup e.g., available
        created_at      # provides the date the backup was created
        availability_zone       # returns the availability zone where a backup is hosted
        volume_id       # returns the id of the volume
        container       # returns the container holding the backup

3. Obtain the details of a volume backup by ID:

        conn.volume_backups.get("VolumeBackup_id")
        
        name    # returns the name of the volume backup
        status  # provides the status of the volume backup e.g., available
        created_at      # provides the date the backup was created
        volume_id       # returns the id of the volume
        container       # returns the container holding the backup

4. Create a volume backup:

        conn.volume_backups.create(
                :name => "My Volume Backup",
                :volume_id => "volume_id")

5. Restore from a volume backup into a new volume:

        # restore into a new volume
        backup = conn.volume_backups.get("VolumeBackup_id")
        backup.restore
        => true

6. Restore from a volume backup into an existing volume:

        # restore into an existing volume
        backup = conn.volume_backups.get("VolumeBackup_id")
        backup.restore("volume_id")
        => true

7. Delete a volume backup:

        backup = conn.volume_backups.get("VolumeBackup_id")
        backup.destroy

##Using the Request Abstraction## {#RequestLayer}

This section discusses the various operations you can perform using the request abstraction:

* [Volume Operations (Request Layer)](#RequestVolumeOperations)
* [Snapshot Operations (Request Layer)](#RequestSnapshotOperations)
* [Volume Backup Operations (Request Layer)](#RequestVolBackupOperations)

###Volume Operations (Request Layer)### {#RequestVolumeOperations}

This section discusses the volume operations you can perform using the request abstraction.

1. List all available volumes for an account

        conn.list_volumes
        body['volumes']                    # returns an array of volume hashes
        headers                            # returns the headers
        body['volumes'][0]['displayName']  # returns the name of the volume

2. List available volumes using a filter:

        conn.list_volumes_detail(:display_name => "Test Volume")

3. Obtain the details of a volume by ID:

        conn.get_volume_details("volume_id")
        volume = response.body['volume']
        volume['displayName']                  # returns the name of the volume
        volume['size']                               # returns the size of the volume
        volume['status']                            # returns the status of the volume e.g. available, in-use


4. Create a volume:

        conn.create_volume('display_name' => 'Test Volume', 'size' => 10)
        volume['id']                    # returns the id of the new volume
        volume['displayName']           # => "demo-vol"
        volume['size'] # => 10
        volume['status']                          # returns the status of the volume e.g. creating, available

5. Create a new volume from an existing image:

        conn.create_volume('display_name' => 'Test Volume 1', 
        'display_description' => 'Test Volume from image', 
        'size' => 10, 
        'imageRef' => 'image_id')

6. Create a new volume from an existing snapshot:

        conn.create_volume(
                'display_name' => 'Test Volume 2', 
                'display_description' => 'New Volume from Snapshot', 
                'snapshot_id' => 'snapshot_id'
                )
        volume['id']                                # returns the id of the new volume
        volume['displayName']                # => "demo-vol"
        volume['size']                             # => 1
        volume['snapshot_id']                 # => 1
        volume['status']                          # returns the status of the volume e.g. creating, available
**Note**: The size of the volume you create from a snapshot is the same as that of the snapshot. The third parameter (the size) has no effect in this case.

7. Create a new volume from an existing volume:

        conn.create_volume(
                'display_name' => 'Test Volume 3', 
                'display_description' => 'Test volume from another image', 
                'source_volid' => 'source_volid')


8. Create a new bootable volume from an suitable single-part image:

        new_volume = conn.create_volume("TestBootVol", 
                                                        "My Test Boot Volume", 
                                                        10, 
                                                        {"imageRef" => "1111111"}
                                                     )
        new_volume.id       # returns the id of the volume
**Note**: You can use a bootable volume to create a persistent server instance.

8. Attach an existing volume to an existing server:

        conn.attach_volume(server_id, volume_id, device)
        volume_attachment = response.body['volumeAttachment']
        volume_attachment['id']       # returns the id of the volume
        volume_attachment['volumeId']  # returns the id of the volume
**Note**: The device parameter is the mount point on the server instance to which the volume is attached (for example, `/dev/sdf`)

9. List volumes attached to a server:

        conn.list_server_volumes("server_id")
        volume_attachments = response.body['volumeAttachments']
        volume_attachment[0]['id']       # returns the id of the volume
        volume_attachment[0]['volumeId']  # returns the id of the volume
        volume_attachment[0]['device']  # returns the device of the volume

10. Detach an existing volume from a server:

        conn.detach_volume("server_id", "volume_id")

11. Update a volume:

        conn.update_volume("volume_id", 
        {'display_name' => 'Test Volume Update'})

12. Delete an existing volume:

        conn.delete_volume(volume_id)

###Snapshot Operations### {#RequestSnapshotOperations}

This section discusses the snapshot operations you can perform using the request abstraction.

1. List all available snapshots for an account:

        conn.list_snapshots
        body['snapshots']                    # returns an array of snapshot hashes
        headers                            # returns the headers
        body['snapshots'][0]['displayName']         # returns the name of the snapshot
        body['snapshots'][0]['size']                       # returns the size of the snapshot
        body['snapshots'][0]['volumeId']               # returns the volume id of the snapshot

2. List the details of all snapshots:

        conn.list_snapshots_detail

3. List the details of a snapshot using a filter:

        conn.list_snapshots_detail(:limit => 2)

4. Obtain the details of a snapshot by ID:

        response = conn.get_snapshot_details("snapshot_id")
        snapshot = response.body['snapshot']
        snapshot['displayName']                  # returns the name of the snapshot
        snapshot['size']                               # returns the size of the snapshot
        snapshot['volumeId']                        # returns the volume id of the snapshot
        snapshot['status']                            # returns the status of the snapshot e.g. available, in-use

5. Create a new snapshot:

        
        conn.create_snapshot("volume_id",
        'display_name' => 'Test Snapshot', 
        'display_description' => 'Test Snapshot from Vol Test')
        snapshot['id']                                # returns the id of the new volume
        snapshot['displayName']                # => "demo-vol"
        snapshot['size']                             # => 1
        snapshot['volumeId']                        # returns the volume id of the snapshot
        snapshot['status']                          # returns the status of the snapshot e.g. creating, available

6. Create a new snapshot using the force parameter:

        conn.create_snapshot("volume_id", 
        'display_name' => 'Test Snapshot 1', 
        'display_description' => 'Test Snapshot 1 from bootable Vol Test 2 in AZ2', 
        'force' => true )

7. Update a snapshot:

        conn.update_snapshot("snapshot_id", 'display_name' => "Test Snapshot 1")

8. Delete a snapshot:

        conn.delete_snapshot(snapshot_id)

###Volume Backup Operations (Request Layer)### {#RequestVolBackupOperations}

This section discusses the volume backup operations you can perform using the request abstraction.

1. List all available volume backups for an account:

        conn.list_volume_backups

2. List details of all available volume backups:

        conn.list_volume_backups_detail

3. Obtain the details of a volume backup by ID:

        conn.get_volume_backup_details("volume_backup_id")

4. Create a volume backup:

        conn.create_volume_backup("volume_id")

5. Restore into a new volume using a volume backup:

        conn.restore_volume_backup("volume_backup_id")
        # creates a new volume that is a clone of the volume the backup was created from

6. Restore into an existing volume using a volume backup:

        conn.restore_volume_backup("volume_backup_id", "volume_id")

7. Delete a volume backup:

        conn.delete_volume_backup("volume_backup_id")
