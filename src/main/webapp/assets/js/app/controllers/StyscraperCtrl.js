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

		

	});

}());
