---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Create the HLM Virtual Machine"
permalink: /helion/openstack/carrier/install/pb/hlm-vm/json-sample/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

| <a href="/helion/openstack/carrier/install/pb/hlm-vm/">&#9650; Create the HLM Virtual Machine</a> |  

# HP Helion OpenStack&#174; Carrier Grade (Beta): Sample JSON File for the HLM Virtual Machine Installation

The [process for installing the HLM VM](/helion/openstack/carrier/install/pb/hlm-vm/) requires a JSON file that will be used when deploying VM.

[
    {
        "name": "ccn1",
        "pxe_mac_address": "52:54:00:97:81:11",
        "pxe_interface": "eth0",
        "pm_type": "ipmilan",
        "pm_ip": "192.168.100.105",
        "pm_user": "kvm-host-username",
        "pm_pass": "kvm-host-pass",
        "failure_zone": "1",
        "node_group": "CCN-001-001",
        "vendor": "HP",
        "model": "DL680",
        "os_partition_size": "20",
        "data_partition_size": "80"
    },
    {
        "name": "ccn2",
        "pxe_mac_address": "52:54:00:6f:34:04",
        "pxe_interface": "eth0",
        "pm_type": "ipmilan",
        "pm_ip": "192.168.100.106",
        "pm_user": "kvm-host-username",
        "pm_pass": "kvm-host-pass",
        "failure_zone": "2",
        "node_group": "CCN-001-001",
        "vendor": "HP",
        "model": "DL680",
        "os_partition_size": "20",
        "data_partition_size": "80"
    },
    {
        "name": "ccn3",
        "pxe_mac_address": "52:54:00:7a:32:06",
        "pxe_interface": "eth0",
        "pm_type": "ipmilan",
        "pm_ip": "192.168.100.107",
        "pm_user": "kvm-host-username",
        "pm_pass": "kvm-host-pass",
        "failure_zone": "3",
        "node_group": "CCN-001-001",
        "vendor": "HP",
        "model": "DL680",
        "os_partition_size": "20",
        "data_partition_size": "80"
   },
    {
        "name": "dcn1",
        "pxe_mac_address": "52:54:00:6f:55:01",
        "pxe_interface": "eth0",
        "pm_type": "ipmilan",
        "pm_ip": "192.168.100.121",
        "pm_user": "kvm-host-username",
        "pm_pass": "kvm-host-pass",
        "failure_zone": "2",
        "node_group": "DCN-001-001",
        "vendor": "HP",
        "model": "DL680",
        "os_partition_size": "20",
        "data_partition_size": "80"
    },
    {
        "name": "vrg1",
        "pxe_mac_address": "52:54:00:6f:66:01",
        "pxe_interface": "eth0",
        "pm_type": "ipmilan",
        "pm_ip": "192.168.100.111",
        "pm_user": "kvm-host-username",
        "pm_pass": "kvm-host-pass",
        "failure_zone": "1",
        "node_group": "DCN-001-001",
        "vendor": "HP",
        "model": "DL680",
        "os_partition_size": "20",
        "data_partition_size": "80"
    },
    {
        "name": "cpn1",
        "pxe_mac_address": "52:54:00:ce:89:85",
        "pxe_interface": "eth0",
        "pm_type": "ipmilan",
        "pm_ip": "192.168.100.104",
        "pm_user": "kvm-host-username",
        "pm_pass": "kvm-host-pass",
        "failure_zone": "2",
        "node_group": "CPN-001-001",
      "vendor": "HP",
        "model": "DL680",
        "os_partition_size": "20",
        "data_partition_size": "80"
    },
    {
        "name": "cpn2",
        "pxe_mac_address": "52:54:00:ce:89:86",
        "pxe_interface": "eth0",
        "pm_type": "ipmilan",
        "pm_ip": "192.168.100.109",
        "pm_user": "kvm-host-username",
        "pm_pass": "kvm-host-pass",
        "failure_zone": "3",
        "node_group": "CPN-001-001",
        "vendor": "HP",
        "model": "DL680",
        "os_partition_size": "20",
        "data_partition_size": "80"
    }
]

Return to [Create the HLM Virtual Machine](/helion/openstack/carrier/install/pb/hlm-vm/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>