# HPE Helion Cloud Foundry Documentation

This is the documentation for Helion Cloud Foundry. It is written in [DITA XML](http://dita.xml.org/) and is stored in a version branch. For any questions, contact Michael Khmelnitsky ([mig281](mailto:https://github.com/mig281)) at <michael.khmelnitsky@hpe.com>.

## Navigating the Document
* `docs.hpcloud.com.ditamap` The ditamap that links to the <docs.hpcloud.com> TOC
* `cf-release/`
  * `docs.hpcloud.com.CFR.ditamap` The ditamap of the document itself
  * `docs.hpcloud.com.CFR_variables.ditamap` The ditamap that contains the variables for everything
    * **Note:** Do not use product names (for example, _Helion Cloud Foundry_) anywhere in the document itself. Add the product names to the appropriate `<keydef>` and then reuse it in your topic using `<keyword>`.
  * `media/` Graphics
  * `quickstart/` Quick start guides
    * `pubcloud/` Quick start for deploying HCF on HP Helion Public Cloud
  * `reference/` Reference topics
  * `root/` Top-level documents
  
## Previewing the Document
Committing and pushing your changes to the branch kicks off a Jenkins build. After it is finished, you can preview the documentation [here](http://docs-staging.hpcloud.com/hcf-1.0-cf-release).
