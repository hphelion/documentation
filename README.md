# HP Cloud: Product and Service Documentation
This repository contains the documentation on using HP Cloud product and services such as HP Cloud Object Storage, the CLIs, and the language bindings. The content here is complimented by two other sources in the API documentation. The API documentation is separated because it is contributed by the services teams. When the full stack of documentation is generated (e.g., to produce a documentation site) both of these locations should be used.

## Branch Structure
The documentation project uses [git flow](https://github.com/nvie/gitflow). Development of documentation should happen on the develop branch while the release version should be on the master branch. Large changes to content or content being prepared to publish in the future should be in feature branches.

For more information on git flow see the article "[A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)".

## Jenkins

The Jenkins job to push the documentation can be found here:

http://keg.dev.uswest.hpcloud.net:8082/view/docs

There are several jobs in Jenkins and a jenkins directory of scripts to support those jobs.  It is best to look at Jenkins and the scripts to understand the jobs.
