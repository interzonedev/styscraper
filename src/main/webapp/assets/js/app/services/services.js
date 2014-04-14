(function() {
    "use strict";

    var services;

    /*
     * Define (or get if it was already defined) the module in which to register application wide services.  This will
     * make all registered services available to an application that includes this as a dependency.
     */
    services = izng.module("styscraper.Services", []);

    // Set constants to be used by all application wide services. 
    services.constant("endpointsUrlPrefix", "");

}());
