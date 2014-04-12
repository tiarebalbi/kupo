<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<spring:url value="/public/" var="pathFile"></spring:url>
<spring:url value="/" var="path"></spring:url>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<meta charset="utf-8" />
	<tiles:importAttribute name="title" />
	<tiles:importAttribute name="page" />
	<title>${page} - ${title}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta content="Kupo Project Manager - Tools for you manager your project using PMBOK&reg; " name="description" />
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
	
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-46760801-1', 'tiarebalbi.com');
	  ga('send', 'pageview');
	  ga('view', 'cliente');
	
	</script>
</head>
<body data-path="${path}" data-cache="${user.id}" data-cache-name="${user.nome}">
</body>
</html>