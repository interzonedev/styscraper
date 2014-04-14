<!DOCTYPE html>

<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Styscraper</title>

        <link rel="icon" href="<c:url value="/assets/img/favicon.png" />" type="image/png" />

        <link rel="stylesheet" href="<c:url value="/assets/css/lib/bootstrap/bootstrap.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/assets/css/app/main.css" />" />
    </head>

    <body>
        <div class="bodyContainer">
            <header>
                <div class="row-fluid">
                    <div class="span12">
                        Styscraper
                    </div>
                </div>
            </header>

            <div class="contentContainer">
                <div ng-app="styscraper.App">
                    <div class="row-fluid">
                        <div class="span12" ng-controller="AlertCtrl">
                            <div ng-repeat="alert in alerts" class="alert alert-{{alert.type}}">
                                <button type="button" class="close" data-dismiss="alert" ng-click="closeAlert(alert.key)">&times;</button>
                                {{alert.msg}}
                            </div>
                        </div>
                    </div>
                    <div ng-controller="ContentCtrl">
                        <div class="row-fluid">
                            <div class="span12">
                                <form name="urlForm">
                                    <div class="control-group" ng-class="{error: urlForm.url.$invalid}">
                                        <label id="url">URL</label>
                                        <input type="url" id="url" name="url" ng-model="url" required />
                                        <span ng-show="urlForm.url.$error.required" class="help-inline">Required</span>
                                        <span ng-show="urlForm.url.$error.url" class="help-inline">Not a URL</span>
                                        <button ng-click="getContent()" ng-disabled="urlForm.$invalid" class="btn-mini btn-primary">Get Content</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="span12">
                                <div ng-bind-html="content"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="<c:url value="/assets/js/lib/jquery/jquery-2.0.3.min.js" />"></script>
        <script src="<c:url value="/assets/js/lib/bootstrap/bootstrap.min.js" />"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
        <script src="http://code.angularjs.org/1.2.16/angular-resource.min.js"></script>
        <script src="http://code.angularjs.org/1.2.16/angular-sanitize.min.js"></script>
        <script src="<c:url value="/assets/js/app/rlng.js" />"></script>
        <script src="<c:url value="/assets/js/app/styscraperApp.js" />"></script>
        <script src="<c:url value="/assets/js/app/directives/directives.js" />"></script>
        <script src="<c:url value="/assets/js/app/services/services.js" />"></script>
        <script src="<c:url value="/assets/js/app/services/StyscraperService.js" />"></script>
        <script src="<c:url value="/assets/js/app/controllers/controllers.js" />"></script>
        <script src="<c:url value="/assets/js/app/controllers/AlertCtrl.js" />"></script>
        <script src="<c:url value="/assets/js/app/controllers/ContentCtrl.js" />"></script>
    </body>
</html>
