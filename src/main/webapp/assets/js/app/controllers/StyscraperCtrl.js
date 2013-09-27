(function() {
	"use strict";

	var controllers;

	/*
	 * Define (or get if it was already defined) the module in which to register application wide controllers.  This
	 * will make all registered controllers available to an application that includes this as a dependency.
	 */
	controllers = rlng.module("styscraper.Controllers");

	/**
	 * Defines a controller for managing taxonomies.
	 */
	controllers.controller("StyscraperCtrl", function($scope, $rootScope, $log, StyscraperService) {

		$scope.getContent = function() {
			var url;

			url = $scope.url;

			$log.log("StyscraperCtrl: getContent - url = " + url);

			StyscraperService.getContent(url).success(function(data, headers) {
				$scope.content = data.content;
				$rootScope.$broadcast("alert", {
					"type": "success", "msg": "Retrieved content from " + url
				});
			}).error(function(error) {
				$rootScope.$broadcast("alert", {
					"msg": "Error getting content"
				});
			});
		};

	});

}());
