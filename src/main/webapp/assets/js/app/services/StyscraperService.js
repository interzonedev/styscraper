(function() {
    "use strict";

    var services;

    /*
     * Define (or get if it was already defined) the module in which to register application wide services.  This will
     * make all registered services available to an application that includes this as a dependency.
     */
    services = rlng.module("styscraper.Services", []);

    /**
     * Defines a service for sending requests to the styscraper endpoints.
     */
    services.service("StyscraperService", function ($http, endpointsUrlPrefix) {

        /**
         * Gets the cleaned up content from the specified URL.
         * 
         * @param Strign url The URL of the content to scrape and clean up.
         * 
         * @returns An Angular promise upon which success and error callbacks can be registered that will be called
         *          asynchronously when the request completes.
         */
        this.getContent = function(url) {
            return $http.get(endpointsUrlPrefix + "/content?url=" + encodeURIComponent(url));
        };

    });

}());
