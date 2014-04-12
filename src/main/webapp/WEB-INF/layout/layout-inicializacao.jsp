<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<spring:url value="/resources/theme/" var="pathFile"></spring:url>
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
	<meta content="Kupo Manager Project - Tools for you manager your project using PMBOK&reg; " name="description" />
	<meta content="Tiarê Balbi Bonamini - www.tiarebalbi.com" name="author" />
	<!-- BEGIN CORE CSS FRAMEWORK -->
	<link href="${pathFile}plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="${pathFile}plugins/boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/kendo/styles/kendo.common.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/kendo/styles/kendo.flat.min.css" rel="stylesheet" type="text/css"/>
	
	<link href="${pathFile}css/animate.min.css" rel="stylesheet" type="text/css"/>
	<!-- END CORE CSS FRAMEWORK -->
	<!-- BEGIN CSS TEMPLATE -->
	<link href="${pathFile}css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}css/responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}css/custom-icon-set.css" rel="stylesheet" type="text/css"/>
	<!-- END CSS TEMPLATE -->
	<script src="${pathFile}plugins/jquery-1.8.3.min.js" type="text/javascript"></script>
	
</head>
<sec:authentication property="principal.username" var="username" />
<sec:authentication property="principal.usuario.idioma.sigla" var="idioma" />
<body data-path="${pathFile}" data-link="${path}" data-cache-name="${username}" data-language="${idioma}">
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse"> 
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">
			<!-- BEGIN CONTENT HEADER -->
			<div class="header-quick-nav"> 
				<!-- BEGIN HEADER LEFT SIDE SECTION -->
				<div class="pull-left">
					<!-- BEGIN HEADER QUICK LINKS -->
					<ul class="nav quick-section">
						<li class="quicklinks"><a href="#" class="reload"><i class="iconset top-reload"></i></a></li>
						<li class="quicklinks"><span class="h-seperate"></span></li>
						<li class="quicklinks"><a href="#" class="" title="Empresas"><i class="iconset top-tiles"></i></a></li>
						<!-- BEGIN SEARCH BOX -->
						<li class="m-r-10 input-prepend inside search-form no-boarder">
							<span class="add-on"><span class="iconset top-search"></span></span>
							
							<spring:message code="header.search.company" var="headerSearch" />
							<input name="" type="text" class="no-boarder" placeholder="${headerSearch}" style="width:250px;">
						</li>
						<!-- END SEARCH BOX -->
					</ul>
					<!-- BEGIN HEADER QUICK LINKS -->				
				</div>
				<!-- END HEADER LEFT SIDE SECTION -->
				<!-- BEGIN HEADER RIGHT SIDE SECTION -->
				<div class="pull-right"> 
					<!-- BEGIN HEADER NAV BUTTONS -->
					<ul class="nav quick-section">
						<!-- BEGIN SETTINGS -->
						<li class="quicklinks"> 
							<a data-toggle="dropdown" class="dropdown-toggle pull-right" href="#" id="user-options">						
								<span class="iconset top-settings-dark"></span> 	
							</a>
							<ul class="dropdown-menu pull-right" data-role="menu" data-aria-labelledby="user-options">
								<li><a href="#"><spring:message code="menu.user.minhaconta" /> </a></li>
								<li><a href="#"><spring:message code="menu.user.central.suporte"></spring:message> </a></li>
								<li class="divider"></li>                
								<li><a href="${path}logout"><i class="fa fa-power-off"></i>&nbsp;&nbsp;<spring:message code="menu.user.logout" /> </a></li>
							</ul>
						</li>
						<!-- END SETTINGS -->
					</ul>
					<!-- END HEADER NAV BUTTONS -->
				</div>
				<!-- END HEADER RIGHT SIDE SECTION -->
			</div> 
			<!-- END CONTENT HEADER --> 
		</div>
		<!-- END TOP NAVIGATION BAR --> 
	</div>
	<!-- END HEADER -->
	<!-- Page Content -->
	<div class="page-content full-screen">
		<div class="content">
			<div class="row-fluid">
				<tiles:insertAttribute name="content" />
			</div>
		</div> 
	</div>
	<!-- End Page Content -->
	<!-- End Content -->
	
	<!-- Javascript -->
	
	<tiles:importAttribute name="required"/>
	<c:if test="${required == 'sim'}">
		<script src="${pathFile}js/require.js" type="text/javascript"></script>
		<script src="${pathFile}js/require.config.js" type="text/javascript"></script>
		<tiles:importAttribute name="module" />
		<script type="text/javascript">
			requirejs([ "${module}" ]);
		</script>
	</c:if>
	
	<tiles:importAttribute name="plugins" />
	<c:forEach items="${plugins}" var="plugin">
		<script src="${pathFile}${plugin}" type="text/javascript"></script>
	</c:forEach>
	
</body>
</html>

