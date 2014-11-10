(function() {
    "use strict";

    var controllers;

    /*
     * Define (or get if it was already defined) the module in which to register application wide controllers.  This
     * will make all registered controllers available to an application that includes this as a dependency.
     */
    controllers = izng.module("styscraper.Controllers");

    /**
     * Defines a controller for managing retrieiving and displaying content from remote URLs.
     */
    controllers.controller("ContentCtrl", function($scope, $rootScope, $sce, $log, StyscraperService) {

        $scope.retrieving = false;
        $scope.retrievingMessage = null;

        $scope.getContent = function() {
            var url;

            url = $scope.url;

            $scope.retrieving = true;
            $scope.retrievingMessage = "Retrieving content from " + url;
            $scope.content = "";

            $log.log("ContentCtrl: getContent - url = " + url);

            StyscraperService.getContent(url).success(function(data, headers) {
                $scope.retrieving = false;
                $scope.retrievingMessage = null;
                if (data.content) {
                    $scope.content = $sce.trustAsHtml(data.content);
                    $rootScope.$broadcast("alert", {
                        "type": "success",
                        "msg": "Retrieved content from " + url
                    });
                } else {
                    $rootScope.$broadcast("alert", {
                        "msg": "Unable to retrieve content from " + url
                    });
                }
            }).error(function(error) {
                $scope.retrieving = false;
                $scope.retrievingMessage = null;
                $rootScope.$broadcast("alert", {
                    "msg": "Error getting content"
                });
            });
        };

    });

}());
