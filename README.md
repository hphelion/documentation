# HP Cloud: Product and Service Documentation
This repository contains the documentation on using HP Cloud product and services such as HP Cloud Object Storage, the CLIs, and the language bindings. The content here is complimented by two other sources in the tutorials and API documentation. The tutorials are separated from this project because we hope to enable developers to contribute to them. The API documentation is separated because it is contributed by the services teams. When the full stack of documentation is generated (e.g., to produce a documentation site) all 3 of these locations should be used.

## Branch Structure
The documentation project uses [git flow](https://github.com/nvie/gitflow). Development of documentation should happen on the develop branch while the release version should be on the master branch. Large changes to content or content being prepared to publish in the future should be in feature branches.

For more information on git flow see the article "[A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)".

## Jenkins

The Jenkins job to push the documentation can be found here:

http://keg.dev.uswest.hpcloud.net:8082/view/docs

There is one job to merge master (for production) and one job to merge develop (for QA).  An attempt has been made to keep the smarts of the Jenkins jobs in the repo so we can track changes, etc.  The scripts to merge is in this repository and is named merge.sh.
