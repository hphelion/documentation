---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Using System Alarms CLI Commands"
permalink: /helion/openstack/carrier/admin/alarms/cli/commands/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a>  -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Using System Alarms CLI Commands
<!-- From the Titanium Server Admin Guide -->

You can use the CLI to find information about currently active and previously triggered system alarms.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

The following commands are used to interact with the alarms subsystem: 

* system alarm-list
* system alarm-show
* system alarm-delete
* system alarm-history-list 

Before using the commands you must log in to the active controller as the Keystone admin user. For more information, see [Linux User Accounts](/helion/openstack/carrier/admin/linux/users/).

This topic contains the following alarm tables:

* [Resource Alarms](#resource)
* [Maintenance Alarms](#maint)
* [Storage Alarms](#storage)
* [Data Networking Alarms](#data)
* [Controller HA Alarms](#controller)
* [Backup and Restore Alarms](#backup)
* [System Configuration](#config)
* [Software Management Alarms](#mgmt)
* [Virtual Machine Instance Alarms](#virtual)

### Resource Alarms {#resource}

<table>
<th>Alarm ID</th><th>Reason Text</th>Entity Instance ID</th><th>Severity</th><th>Proposed Repair Action</th></tr>
<tr>
<td>100.101</td><td>Platform CPU threshold exceeded; threshold x%, actual y%</td><td>host=&lt;hostname&gt;</td><td>C, M, m</td>
<td>Monitor, and if condition persists, contact next level of support.</td></tr>
<tr>
<td>100.102</td><td>AVS CPU threshold exceeded; threshold x%, actual y%</td>
<td>host=&lt;hostname&gt;</td><td>C, M, m</td><td>Monitor, and if condition persists, contact next level of support.</td></tr>
<tr><td>100.103</td><td>Memory threshold exceeded; threshold x%, actual y%</td><td>host=&lt;hostname&gt;</td><td>C, M, m</td><td>Monitor, and if condition persists, contact next level ofsupport; may require additional memory on host.</td></tr>
<tr><td>100.104</td><td>File System threshold exceeded; threshold x%, actual y%</td><td>host=&lt;hostname&gt;.filesystem=&lt;mount-dir&gt; or filesystem=&lt;mount-dir&gt; or host=&lt;hostname&gt;.volumegroup=&lt;volumegroup-name&gt;</td><td>C, M, m</td><td>(for filesystem) Monitor, and if condition persists, contact next level of support.
<br>(for volumegroup) Monitor, and if condition persists, consider adding additional physical volumes to the volume group</td></tr>
</tbody></table>


### Maintenance Alarms {#maint}

<table>
<tr><th>Alarm ID</th><th>Reason Text</th><th>Entity Instance ID</th><th>Severity</th><th>Proposed Repair Action</th></tr>
<tr><td>100.105</td><td>No access to remote VM volumes.</td><td>host=&lt;hostname&gt;</td><td>M</td><td>Check management and infrastructure networks. Check controller and storage nodes.</td></tr>
<tr><td>100.106</td><td>OAM Port failed</td><td>host=&lt;hostname&gt;.port=&lt;port-name&gt;</td><td>M</td><td>Check cabling, far-end port configuration, and status on adjacent equipment.</td></tr>
<tr><td>100.107</td><td>OAM Interface failed or OAM Interface degraded</td><td>host=&lt;hostname&gt;.interface=&lt;if-name&gt;</td><td>C, M</td><td>Check cabling, far-end port configuration, and status on adjacent equipment.</td></tr>
<tr>
<td>100.108</td><td>MGMT Port failed</td><td>host=&lt;hostname&gt;.port=&lt;port-name&gt;</td><td>M</td><td>Check cabling, far-end port configuration, and status on adjacent equipment.</td></tr>
<tr>
<td>100.109</td><td>MGMT Interface failed or MGMT Interface degraded</td><td>host=&lt;hostname&gt;.interface=&lt;if-name&gt;</td><td>C, M</td><td>Check cabling, far-end port configuration, and status on adjacent equipment.</td></tr>
<tr>
<td>100.110</td><td>INFRA Port failed</td><td>host=&lt;hostname&gt;.port=&lt;port-name&gt;</td><td>M</td><td>Check cabling, far-end port configuration, and status on adjacent equipment.</td></tr>
<tr><td>100.111</td><td>INFRA Interface failed or INFRA Interface degraded</td><td>host=&lt;hostname&gt;.interface=&lt;if-name&gt;</td><td>C, M</td><td>Check cabling, far-end port configuration, and status on adjacent equipment.</td></tr>
<tr>
<td>200.001</td><td>Host was administratively locked to take it out-of-service</td><td>host=&lt;hostname&gt;</td><td>W</td><td>Administratively unlock host to bring it back in-service.</td></tr>
<tr>
<td>200.004</td><td>Host experienced a service-affecting failure.</td><td>host=&lt;hostname&gt;</td><td>C</td><td>If problem consistently occurs after host is reset, contact next level of support, or lock and replace failing host.</td></tr>
<tr><td>200.005</td><td>Host is experiencing a persistent critical communication failure. Resetting Host.</td><td>host=&lt;hostname&gt;</td><td>C</td><td>If problem consistently occurs after host is reset, contact next level of support, or lock and replace failing host.</td></tr>
<tr>
<td>200.006</td><td>One or more critical processes on host have failed and can not be recovered. Resetting host</td><td>host=&lt;hostname&gt;</td><td>C, M</td><td>If problem consistently occurs after host is reset, contact next level of support or lock and replace failing host.</td></tr>
<tr>
<td>200.008</td><td><em class="ph i">ntpd</em> process has failed on host</td><td>host=&lt;hostname&gt;</td><td>m</td><td><em class="ph i">ntpd</em> is a process that can not be auto recovered. The host must be re-enabled (locked and then unlocked) to clear this alarm. If the alarm persists then contact next level of support to investigate and recover.</td></tr>
<tr>
<td>200.009</td><td>Degrade: Host is experiencing an intermittent infrastructure network communication failure that has exceeded its lower alarming threshold.
<br>Failure: Host is experiencing a persistent critical infrastructure Network communication failure. Resetting Host.</td><td>host=&lt;hostname&gt;</td><td>C, M</td><td>If problem consistently occurs after host is reset, contact next level of support, or lock and replace failing host.</td></tr>
<tr>
<td>200.010</td><td>Access to board management module has failed</td><td>host=&lt;hostname&gt;</td><td>W</td><td>Check host's board management configuration and connectivity.</td></tr>
</table>

### Storage Alarms {#storage}

<table>
<tr><th>Alarm ID</th><th>Reason Text</th><th>Entity Instance ID</th><th>Severity</th><th>Proposed Repair Action</th></tr>
<tr>
<td>800.001</td><td>Storage alarm condition: &lt;failure reason</td><td>cluster=&lt;dist-fs-uuid&gt;</td><td>C, M</td><td>If problem persists, contact next level of support.
</table>

### Data Networking Alarms {#data}

<table>
<tr>
<th>Alarm ID</th><th>Reason Text</th><th>Entity Instance ID</th><th>Severity</th><th>Proposed Repair Action</th></tr>
<tr>
<td>300.001</td><td>Data port failed</td><td>host=&lt;hostname&gt;.port=&lt;port-uuid&gt;</td><td>M</td><td>Check cabling, far-end port configuration, and status on adjacent equipment.</td></tr>
<tr>
<td>300.002</td><td>Data interface failed or Data interface degraded</td><td>host=&lt;hostname&gt;.interface=&lt;if-uuid&gt;</td><td>C, M</td><td>Check cabling, far-end port configuration, and status on adjacent equipment.</td></tr>
<tr>
<td>300.003</td><td>Networking agent not responding</td><td>host=&lt;hostname&gt;.agent=&lt;agent-uuid&gt;</td><td>M</td><td>If condition persists, attempt to clear issue by administratively locking and unlocking the host.</td></tr>
<tr>
<td>300.004</td><td>No enabled compute node with connectivity to provider network</td><td>host=&lt;hostname&gt;.providernet=&lt;pnet-uuid&gt;</td><td>M</td><td>Enable compute nodes with required provider network connectivity.</td></tr>
</table>

### Controller HA Alarms {#controller}

<table>
<tr><th>Alarm ID</th><th>Reason Text</th><th>Entity Instance ID</th><th>Severity</th><th>Proposed Repair Action</th></tr>
<tr>
<td>400.001</td><td>Service group failure; &lt;list of affected services&gt; or Service group degraded; &lt;list of affected services&gt; or Service group warning; &lt;list of affected services&gt;</td><td>service_domain=&lt;domain_name&gt;.service_group=&lt;group_name&gt;.host=&lt;hostname&gt;</td><td>C, M, m</td><td>Contact next level of support.</td></tr>
<tr>
<td>400.002</td><td>Service group loss of redundancy; expected &lt;num&gt; standby member&lt;s&gt; but only &lt;num&gt; standby member&lt;s&gt; available or Service group loss of redundancy; expected &lt;num&gt; standby member&lt;s&gt; but only &lt;num&gt; standby member&lt;s&gt; available or Service group loss of redundancy; expected &lt;num&gt; active member&lt;s&gt; but no active members available or Service group loss of redundancy; expected &lt;num&gt; active member&lt;s&gt; but only &lt;num&gt; active member&lt;s&gt; available</td><td>service_domain=&lt;domain_name&gt;.service_group=&lt;group_name&gt;</td><td>M</td><td>Bring a controller node back into service, otherwise contact next level of support.</td></tr>
<tr>
<td>400.003</td><td>License key has expired or is invalid; a valid license key is required for operation or Evaluation license key will expire on &lt;date&gt;; there are only 7 or less days remaining in this evaluation or Evaluation license key will expire on &lt;date&gt;; there are &lt;num_days&gt; days remaining in this evaluation</td><td>host=&lt;hostname&gt;</td><td>C, M, m</td><td>Contact next level of support to obtain a new license key.</td></tr>
<tr>
<td>400.004</td><td>Service group software modification detected; &lt;list of affected files&gt;</td><td>host=&lt;&lt;hostname&gt;&gt;</td><td>M</td><td>Contact next level of support.</td></tr>
<tr>
<td>400.005</td><td>Communication failure detected with peer over interface &lt;linux-ifname&gt; or Communication failure detected with peer over interface &lt;linux-ifname&gt; within the last 30 seconds</td><td>host=&lt;hostname&gt;.network=&lt;mgmt | oam | infra&gt; </td><td>M</td><td>Check cabling, far-end port configuration, and status on adjacent equipment.</td></tr>
</table>

### Backup and Restore Alarms {#backup}

<table>
<tr><th>Alarm ID</th><th>Reason Text</th><th>Entity Instance ID</th><th>Severity</th><th>Proposed Repair Action</th></tr>
<tr>
<td>210.001</td><td>System Backup in progress</td><td>host=controller</td><td>m</td><td>No action required.</td></tr>
</table>

### System Configuration {#config}

<table>
<tr><th>Alarm ID</th><th>Reason Text</th><th>Entity Instance ID</th><th>Severity</th><th>Proposed Repair Action</th></tr>
<tr><td>250.001</td><td>Configuration is out of date</td><td>host=&lt;hostname&gt;</td><td>M</td><td>Administratively lock and unlock &lt;hostname&gt; to update config.</td></tr>
</table>

### Software Management Alarms {#mgmt}

<table>
<th>Alarm ID</th><th>Reason Text</th><th>Entity Instance ID</th><th>Severity</th><th>Proposed Repair Action</th></tr>
<tr><td>900.001</td><td>Patching operation in progress</td><td>host=controller</td><td>m</td><td>Complete reboots of affected hosts.</td></tr>
<tr>
<td>900.002</td><td>Obsolete patch in system</td><td>host=controller</td><td>W</td><td>Remove and delete obsolete patches.</td></tr>
<tr>
<td>900.003</td><td>Patch host install failure</td><td>host=&lt;<var class="keyword varname">hostname</var>&gt;</td><td>M</td><td>Undo patching operation.</td>
</tr>
</table>

### Virtual Machine Instance Alarms {#virtual}
            
            <table summary="" id="psa1413927942547__simpletable_qbs_njg_vp" class="simpletable wide" border="1" cellpadding="4" cellspacing="0"><tbody><tr class="sthead">
                    <th id="d54607e1823" class="stentry" valign="bottom" width="9.677419354838712%" align="left">
                        <p class="p">Alarm ID</p>

                    </th>

                    <th id="d54607e1829" class="stentry" valign="bottom" width="24.19354838709678%" align="left">
                        <p class="p">Reason Text</p>

                    </th>

                    <th id="d54607e1835" class="stentry" valign="bottom" width="24.19354838709678%" align="left">
                        <p class="p">Entity Instance ID</p>

                    </th>

                    <th id="d54607e1841" class="stentry" valign="bottom" width="9.677419354838712%" align="left">
                        <p class="p">Severity</p>

                    </th>

                    <th id="d54607e1847" class="stentry" valign="bottom" width="32.25806451612904%" align="left">
                        <p class="p">Proposed Repair Action</p>

                    </th>

                </tr>
<tr class="strow">
                    <td headers="d54607e1823" class="stentry" valign="top">
                        <p class="p">700.001</p>

                    </td>

                    <td headers="d54607e1829" class="stentry" valign="top">
                        <p class="p">Instance has encountered a non-recoverable error</p>

                    </td>

                    <td headers="d54607e1835" class="stentry" valign="top">
                        <p class="p">instance=&lt;<var class="keyword varname">instance_uuid</var>&gt;</p>

                    </td>

                    <td headers="d54607e1841" class="stentry" valign="top">
                        <p class="p">C</p>

                    </td>

                    <td headers="d54607e1847" class="stentry" valign="top">
                        <p class="p">The system will automatically attempt to re-start the
                            instance at regular intervals. No repair action required.</p>

                    </td>

                </tr>
<tr class="strow">
                    <td headers="d54607e1823" class="stentry" valign="top">
                        <p class="p">700.002</p>

                    </td>

                    <td headers="d54607e1829" class="stentry" valign="top">
                        <p class="p">Instance is stopped or shutoff</p>

                    </td>

                    <td headers="d54607e1835" class="stentry" valign="top">
                        <p class="p">instance=&lt;<var class="keyword varname">instance_uuid</var>&gt;</p>

                    </td>

                    <td headers="d54607e1841" class="stentry" valign="top">
                        <p class="p">C</p>

                    </td>

                    <td headers="d54607e1847" class="stentry" valign="top">
                        <p class="p">Restart the instance (<span class="keyword cmdname">nova start
                                    &lt;instance&gt;</span>)</p>

                    </td>

                </tr>
<tr class="strow">
                    <td headers="d54607e1823" class="stentry" valign="top">
                        <p class="p">700.003</p>

                    </td>

                    <td headers="d54607e1829" class="stentry" valign="top">
                        <p class="p">Instance is rebooting</p>

                    </td>

                    <td headers="d54607e1835" class="stentry" valign="top">
                        <p class="p">instance=&lt;<var class="keyword varname">instance_uuid</var>&gt;</p>

                    </td>

                    <td headers="d54607e1841" class="stentry" valign="top">
                        <p class="p">C</p>

                    </td>

                    <td headers="d54607e1847" class="stentry" valign="top">
                        <p class="p">Wait for reboot completion. If problem persists contact next level of support.</p>

                    </td>

                </tr>
<tr class="strow">
                    <td headers="d54607e1823" class="stentry" valign="top">
                        <p class="p">700.004</p>

                    </td>

                    <td headers="d54607e1829" class="stentry" valign="top">
                        <p class="p">Instance is paused</p>

                    </td>

                    <td headers="d54607e1835" class="stentry" valign="top">
                        <p class="p">instance=&lt;<var class="keyword varname">instance_uuid</var>&gt;</p>

                    </td>

                    <td headers="d54607e1841" class="stentry" valign="top">
                        <p class="p">C</p>

                    </td>

                    <td headers="d54607e1847" class="stentry" valign="top">
                        <p class="p">Unpause the instance (<span class="keyword cmdname">nova unpause
                                &lt;instance&gt;</span>)</p>

                    </td>

                </tr>
<tr class="strow">
                    <td headers="d54607e1823" class="stentry" valign="top">
                        <p class="p">700.005</p>

                    </td>

                    <td headers="d54607e1829" class="stentry" valign="top">
                        <p class="p">Instance is suspended</p>

                    </td>

                    <td headers="d54607e1835" class="stentry" valign="top">
                        <p class="p">instance=&lt;<var class="keyword varname">instance_uuid</var>&gt;</p>

                    </td>

                    <td headers="d54607e1841" class="stentry" valign="top">
                        <p class="p">C</p>

                    </td>

                    <td headers="d54607e1847" class="stentry" valign="top">
                        <p class="p">Resume the instance (<span class="keyword cmdname">nova
                                resume &lt;instance&gt;</span>)</p>

                    </td>

                </tr>
<tr class="strow">
                    <td headers="d54607e1823" class="stentry" valign="top">
                        <p class="p">700.006</p>

                    </td>

                    <td headers="d54607e1829" class="stentry" valign="top">
                        <p class="p">Instance is evacuating or rebuilding</p>

                    </td>

                    <td headers="d54607e1835" class="stentry" valign="top">
                        <p class="p">instance=&lt;<var class="keyword varname">instance_uuid</var>&gt;</p>

                    </td>

                    <td headers="d54607e1841" class="stentry" valign="top">
                        <p class="p">C</p>

                    </td>

                    <td headers="d54607e1847" class="stentry" valign="top">
                        <p class="p">Wait for evacuate completion. Check health of compute
                            nodes and network. If problem persists contact next level of
                            support.</p>

                    </td>

                </tr>
<tr class="strow">
                    <td headers="d54607e1823" class="stentry" valign="top">
                        <p class="p">700.007</p>

                    </td>

                    <td headers="d54607e1829" class="stentry" valign="top">
                        <p class="p">Instance is live migrating</p>

                    </td>

                    <td headers="d54607e1835" class="stentry" valign="top">
                        <p class="p">instance=&lt;<var class="keyword varname">instance_uuid</var>&gt;</p>

                    </td>

                    <td headers="d54607e1841" class="stentry" valign="top">
                        <p class="p">W</p>

                    </td>

                    <td headers="d54607e1847" class="stentry" valign="top">
                        <p class="p">Wait for live migration completion. If problem persists contact next level of support.</p>

                    </td>

                </tr>
<tr class="strow">
                    <td headers="d54607e1823" class="stentry" valign="top">
                        <p class="p">700.008</p>

                    </td>

                    <td headers="d54607e1829" class="stentry" valign="top">
                        <p class="p">Instance is cold migrating or resizing</p>

                    </td>

                    <td headers="d54607e1835" class="stentry" valign="top">
                        <p class="p">instance=&lt;<var class="keyword varname">instance_uuid</var>&gt;</p>

                    </td>

                    <td headers="d54607e1841" class="stentry" valign="top">
                        <p class="p">C</p>

                    </td>

                    <td headers="d54607e1847" class="stentry" valign="top">
                        <p class="p">Wait for cold migration or resize completion. If
                                (<span class="keyword cmdname">nova show &lt;instance&gt;</span>) reports a STATUS of
                            VERIFY_RESIZE, then a resize confirmation is required (<span class="keyword cmdname">nova
                                resize-confirm &lt;instance&gt;</span>). If problem persists
                            contact next level of support.</p>

                    </td>

                </tr>
</tbody></table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----