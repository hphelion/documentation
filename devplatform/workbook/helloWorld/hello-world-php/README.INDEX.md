# Hello World PHP

To create a Cloud Foundry app in PHP, the only mandatory files are the index.php
and manifest.yml files. 

Manifest.yml is a config file used to specify settings that would otherwise be
specified by a command-line tool. For PHP, only the name and buildpack fields are
required. The buildpack field is a URL for the buildpack that supports the 
necessary language and/or framework.

The composer.json file is completely optional. However, certain buildpacks may
issue a warning if the file is not present.
