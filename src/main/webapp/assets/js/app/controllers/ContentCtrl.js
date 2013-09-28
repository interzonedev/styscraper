(function() {
	"use strict";

	var controllers;

	/*
	 * Define (or get if it was already defined) the module in which to register application wide controllers.  This
	 * will make all registered controllers available to an application that includes this as a dependency.
	 */
	controllers = rlng.module("styscraper.Controllers");

	/**
	 * Defines a controller for managing retrieiving and displaying content from remote URLs.
	 */
	controllers.controller("ContentCtrl", function($scope, $rootScope, $log, StyscraperService) {

		$scope.getContent = function() {
			var url;

			$scope.content = "";

			url = $scope.url;

			$log.log("ContentCtrl: getContent - url = " + url);

			StyscraperService.getContent(url).success(function(data, headers) {
				if (data.content) {
					$scope.content = data.content;
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
				$rootScope.$broadcast("alert", {
					"msg": "Error getting content"
				});
			});
		};

	});

}());
