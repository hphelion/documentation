---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta):  Specifying Local Storage for a VM"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/storage/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Specifying Local Storage for a VM

You can specify the use of local storage or Cinder-based storage by using a flavor with the required extra
specification.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

Before you can use local storage for a VM, you must configure at least one compute node to provide local storage.

**Caution:** Local storage is ephemeral.

* Unlike Cinder-based storage, local storage does not persist when the instance is terminated or if the
compute node fails.
* Live migration for local storage is not currently supported. Only cold migration is supported for an
instance using local storage, where a new initial volume is created for the instance.

To add this extra spec to a flavor using the Horizon dashboard, use the VCPU Model selection in the [Create Flavor Extra Spec drop-down menu](/helion/commercial/carrier/dashboard/managing/flavors/extra/).

You can also specify the extra spec from the CLI by setting the following parameter for a flavor:

	aggregate_instance_extra_specs:local_storage=loc_storage

where loc_storage is one of the following:

* true - Specifies ephemeral local storage for use by the VM.
* false - Specifies persistent Cinder-based storage for use by the VM.

**Example:**

	nova flavor-key flavor_name \
	set aggregate_instance_extra_specs=integer_value

If this extra specification is not defined for a flavor, then VMs launched using the flavor are instantiated without
regard for the storage type.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
