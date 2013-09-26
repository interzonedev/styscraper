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
		<div id="bodyContainer">
			<header>
			</header>

			<div id="contentContainer">
				<div class="pageHeader">
					Styscraper
				</div>
				<div ng-app="styscraper.App">
					Home
				</div>
			</div>
		</div>

		<script src="<c:url value="/assets/js/lib/jquery/jquery-2.0.3.min.js" />"></script>
		<script src="<c:url value="/assets/js/lib/bootstrap/bootstrap.min.js" />"></script>
		<script src="<c:url value="/assets/js/lib/angular/angular.js" />"></script>
		<script src="<c:url value="/assets/js/lib/angular/angular-resource.js" />"></script>
		<script src="<c:url value="/assets/js/app/rlng.js" />"></script>
		<script src="<c:url value="/assets/js/app/styscraperApp.js" />"></script>
		<script src="<c:url value="/assets/js/app/directives/directives.js" />"></script>
		<script src="<c:url value="/assets/js/app/services/services.js" />"></script>
		<script src="<c:url value="/assets/js/app/services/StyscraperService.js" />"></script>
		<script src="<c:url value="/assets/js/app/controllers/controllers.js" />"></script>
		<script src="<c:url value="/assets/js/app/controllers/StyscraperCtrl.js" />"></script>
	</body>
</html>
