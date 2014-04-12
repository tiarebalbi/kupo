<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<spring:url value="/resources/theme/" var="pathFile"></spring:url>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<meta charset="utf-8" />
	<tiles:importAttribute name="title" />
	<tiles:importAttribute name="page" />
	<title>${page} - ${title}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta content="Kupo Manager Project - Tools for you manager your project using PMBOK&reg; " name="description" />
	<meta content="Tiarê Balbi Bonamini - www.tiarebalbi.com" name="author" />
	<!-- BEGIN CORE CSS FRAMEWORK -->
	<link href="${pathFile}plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="${pathFile}plugins/boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}css/animate.min.css" rel="stylesheet" type="text/css"/>
	<!-- END CORE CSS FRAMEWORK -->
	<!-- BEGIN CSS TEMPLATE -->
	<link href="${pathFile}css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}css/responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}css/custom-icon-set.css" rel="stylesheet" type="text/css"/>
	<!-- END CSS TEMPLATE -->
	
</head>
<body class="error-body no-top lazy" data-original="${pathFile}img/wallpaper.jpg" style="background: url(${pathFile}img/wallpaper.jpg) top center;">
	<div class="container">
		<div class="row login-container animated fadeInUp">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
	</div>
</body>
</html>