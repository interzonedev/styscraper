<!DOCTYPE html>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en-US">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <title>Styscraper</title>

        <link rel="icon" href="<c:url value="/assets/img/favicon.png" />" type="image/png" />

        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

        <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
    </head>

    <body>
        <div class="container lead">
            <header>
                <div class="page-header">
                    <h1>Styscraper</h1>
                </div>
            </header>

            <div ng-app="styscraper.App">
                <div ng-controller="AlertCtrl">
                    <div class="row">
                        <div class="col-xs-12">
                            <div ng-repeat="alert in alerts" class="alert alert-{{alert.type}}" ng-cloak>
                                <button type="button" class="close" data-dismiss="alert" ng-click="closeAlert(alert.key)">&times;</button>
                                {{alert.msg}}
                            </div>
                        </div>
                   </div>
                </div>
                <div ng-controller="ContentCtrl">
                    <div class="row">
                        <div class="col-xs-12">
                            <form name="urlForm" role="form">
                                <div class="form-group" ng-class="{'has-error': urlForm.url.$invalid, 'has-success': !urlForm.url.$invalid}" ng-cloak>
                                    <label class="control-label" for="url">URL</label>
                                    <input type="url" class="form-control" id="url" name="url" ng-model="url" required />
                                    <span ng-show="urlForm.url.$error.required" class="text-danger">Required</span>
                                    <span ng-show="urlForm.url.$error.url" class="text-danger">Not a URL</span>
                                </div>
                                <button ng-click="getContent()" ng-disabled="urlForm.$invalid" class="btn btn-primary btn-xs">Get Content</button>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div ng-bind-html="content"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="//code.jquery.com/jquery-2.1.0.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular-resource.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular-sanitize.min.js"></script>
        <script src="<c:url value="/assets/js/app/izng.js" />"></script>
        <script src="<c:url value="/assets/js/app/styscraperApp.js" />"></script>
        <script src="<c:url value="/assets/js/app/directives/directives.js" />"></script>
        <script src="<c:url value="/assets/js/app/services/services.js" />"></script>
        <script src="<c:url value="/assets/js/app/services/StyscraperService.js" />"></script>
        <script src="<c:url value="/assets/js/app/controllers/controllers.js" />"></script>
        <script src="<c:url value="/assets/js/app/controllers/AlertCtrl.js" />"></script>
        <script src="<c:url value="/assets/js/app/controllers/ContentCtrl.js" />"></script>
    </body>
</html>
