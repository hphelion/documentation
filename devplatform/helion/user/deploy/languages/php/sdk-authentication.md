---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/php/authentication/
title: "Identity Service, Authentication, and the Service Catalog"
---
<!--PUBLISHED-->
#Identity Service, Authentication, and the Service Catalog

The [Identity Service API](https://docs.hpcloud.com/identity) is central to using the
APIs for the services by HP Helion. Identity Service not only deals with authentication
but also supplies the catalog of information around the activated and available services.
For example, this API is where the API endpoints for services like the different compute regions,
Object Storage, and everything else is available.

The HP Helion PHP SDK provides functionality to interact with identity service and authentication
at a low level or, through the use of helpers, simply authenticate commonly and use it everywhere.

Authentication and Tokens
-------------------------
The first step is authenticating as a user and there are two ways to do this. The first
option is to use the username and password used to log into the console. The second
option is to use an access key id and secret key available on the API Keys page within the console.

Since services are associated with tenants you need to use a tenantId or tenantName to
get a valid token for a set of services.

Before you look at the helper function let's take a quick look at authenticating manually.

    $identity = new \HPCloud\Services\IdentityServices($endpoint);
    try {
        $token = $identity->authenticateAsAccount($account, $secret, $tenantId, $tenantName);
    }
    catch (\Exception $e) {
        // Authentication failed.
    }

This example authenticates as an account with an access key id and secret key. Only
the tenantId or tenantName needs to be supplied as the other is optional. If authentication
passed, the identity object is authenticated and a token is returned.

If authentication failed or there was another error an exception is thrown. There are a
number of exceptions that can be caught depending on the type of error that occurred.

If you want to authenticate as a user with your console username and password it looks
almost the same as authenticating as an account.

    $identity = new \HPCloud\Services\IdentityServices($endpoint);
    try {
        $token = $identity->authenticateAsUser($username, $password, $tenantId, $tenantName);
    }
    catch (\Exception $e) {
        // Authentication failed.
    }

Note that while you **can** authenticate with a username and password, we recommend using the access key id and secret key method.

###A Bootstrap Identity Helper


If the bootstrap mechanism to setup any global options was used there is a helper
function to get an identity object. For example:

    <?php
    require_once 'vendor/autoload.php';
    use \HPCloud\Bootstrap;
    // Provide credentials
    $settings = array(
        'account' => YOUR_ACCESS_KEY_ID,
        'secret' => YOUR_SECRET_KEY,
        'tenantid' => YOUR_TENANT_ID,
        'endpoint' => IDENTITY_SERVICES_URL,
    );
    Bootstrap::setConfiguration($settings);

Using the helper method identity an identity object is available.


    $identity = Bootstrap::identity();


This object will be authenticated with the credentials provided to the bootstrap.

##The Service Catalog
The service catalog lists the available services. Accessing the catalog, which includes
the API endpoints, is fairly simple through the use of the serviceCatalog method. To
get the entire catalog call the method with no arguments.

    $identity = Bootstrap::identity();
    $catalog = $identity->serviceCatalog();

Calling the serviceCatalog method with the name of a service will return the service
catalog for just this service.

    $identity = Bootstrap::identity();
    $catalog = $identity->serviceCatalog('object-store');

