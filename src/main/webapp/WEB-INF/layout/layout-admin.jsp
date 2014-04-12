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
	<link href="${pathFile}plugins/jquery-slider/css/jquery.sidr.light.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="${pathFile}plugins/boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/kendo/styles/kendo.common.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}plugins/kendo/styles/kendo.flat.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}css/animate.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}css/responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${pathFile}css/custom-icon-set.css" rel="stylesheet" type="text/css"/>
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
	
	<!-- HEAD -->
	<div class="header navbar navbar-inverse">
		<div class="navbar-inner">
			<div class="header-seperation">  
				<ul class="nav pull-left notifcation-center" id="main-menu-toggle-wrapper" style="display:none">
					<li class="dropdown"> 
						<a id="main-menu-toggle" href="#main-menu"> 
							<span class="iconset top-menu-toggle-white"></span> 
						</a>
					</li>	
				</ul>
				
				<!-- Logo -->
				<a href="${path}"><img src="${pathFile}img/logo.png" class="logo" alt="" data-src="${pathFile}img/logo.png" data-src-retina="${pathFile}img/logo2x.png" width="106" height="21"/></a>
				<!-- Fim Logo -->

				<ul class="nav pull-right notifcation-center">	
					<li class="dropdown" id="header_task_bar"> 
						<a href="${path}" class="dropdown-toggle active"> <span class="iconset top-home"></span> </a> 
					</li>
					<li class="dropdown" id="header_inbox_bar" > 
						<a href="${path}notificacao" class="dropdown-toggle" > 
							<span class="iconset top-messages"></span>  <span class="badge" id="notificacao-badge">2</span>
						</a>
					</li>
					<li class="dropdown" id="portrait-chat-toggler" style="display:none"> 
						<a href="#sidr" class="chat-menu-toggle"> <span class="iconset top-chat-white"></span> </a> 
					</li>
				</ul>
			</div>
			<div class="header-quick-nav" >
				<!-- Left -->
				<div class="pull-left">
					<ul class="nav quick-section">
						<li class="quicklinks">
							<a href="#" class="" id="layout-condensed-toggle" >
								<span class="iconset top-menu-toggle-dark"></span>
							</a>
						</li>
					</ul>
					
					<ul class="nav quick-section">
						<li class="quicklinks">
							<a href="#">
								<span class="iconset top-reload"></span>
							</a>
						</li>
						<li class="quicklinks"> <span class="h-seperate"></span></li>
						<li class="quicklinks"> 
							<spring:message code="dashboard.modules.title" var="modulesName" />
							<a href="#" data-toggle="tooltip" data-original-title="${modulesName}">
            					<span class="iconset top-tiles"></span>
           					</a> 
           				</li>
           				<li class="m-r-10 input-prepend inside search-form no-boarder">
           					<span class="add-on"><span class="iconset top-search"></span></span>
           					<spring:message code="dashboard.search.placeholder" var="searchTerm" />
           					<input name="" type="text"  class="no-boarder " placeholder="${searchTerm}" style="width:250px;">
           				</li>
					</ul>
				</div>
				
				<!-- Right -->
				<div class="pull-right">
					<ul class="nav quick-section ">
						<li class="quicklinks">
							<a data-toggle="dropdown" class="dropdown-toggle  pull-right " href="#" id="user-options">
								<span class="iconset top-settings-dark "></span>
							</a>
							<ul class="dropdown-menu  pull-right" role="menu" aria-labelledby="user-options">
								<li>
									<a href="${path}minha-conta"> <spring:message code="menu.user.minhaconta"/></a>
                  				</li>
                  				<li>
									<a href="${path}administracao/central-suporte"> <spring:message code="menu.user.central.suporte"/></a>
                  				</li>
                  				<li>
									<a href="${path}notificacoes"> <spring:message code="menu.user.notificacao"/></a>
                  				</li>
                  				<li class="divider"></li>
                  				<li>
									<a href="${path}logout"><i class="fa fa-power-off"></i>&nbsp;&nbsp;<spring:message code="menu.user.logout"/></a>
                  				</li>
							</ul>
						</li>
						<li class="quicklinks"> <span class="h-seperate"></span></li>
						<li class="quicklinks">
							<a id="chat-menu-toggle" href="#sidr" class="chat-menu-toggle" >
								<span class="iconset top-chat-dark ">
									<span class="badge badge-important hide" id="chat-message-count">0</span>
								</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div> 
	</div>
	<!-- HEAD END -->
	<!-- Content -->
	<div class="page-container row-fluid">
		
		<!-- Menu -->
		<div class="page-sidebar" id="main-menu"> 
			<div class="page-sidebar-wrapper" id="main-menu-wrapper">
				<div class="user-info-wrapper">
					<div class="profile-wrapper">
						<img src="${pathFile}img/profiles/avatar.jpg"  alt="${user.nome}" data-src="${pathFile}img/profiles/avatar.jpg" data-src-retina="${pathFile}img/profiles/avatar2x.jpg" width="69" height="69" />
					</div>
					<div class="user-info">
						<div class="greeting"><spring:message code="system.welcome" /></div>
						<div class="username"><sec:authentication property="principal.usuario.nome"/> <span class="semi-bold"><sec:authentication property="principal.usuario.sobrenome"/></span></div>
						<div class="status">Status <a href="#" class="status-user"><span class="status-icon green"></span>Online</a></div>
					</div>
				</div>
				<p class="menu-title">MENU <span class="pull-right"><a href="javascript:;"><i class="fa fa-refresh"></i></a></span></p>

				<ul>
					<li class="start active"> 
						<a href="${path}"> 
							<i class="icon-custom-home"></i> 
							<span class="title"><spring:message code="nav.administracao.principal.dashboard" /></span> 
						</a> 
					</li>
					<li class="">
						<a href="javascript:;"> 
							<i class="icon-custom-home"></i> 
							<span class="title"><spring:message code="nav.administracao.principal.clientes" /></span>
							<span class="arrow "></span> 
						</a> 
						<ul class="sub-menu">
							<li><a href="${path}administracao/cliente"> <spring:message code="nav.administracao.principal.clientes" /> </a></li>
							<li><a href="${path}administracao/cliente/empresa"> <spring:message code="nav.administracao.principal.clientes.empresas" /> </a></li>
						</ul>
					</li>
					<li class="">
						<a href="javascript:;"> 
							<i class="fa fa-tasks"></i> 
							<span class="title"><spring:message code="nav.administracao.principal.servicos" /></span>
							<span class="arrow "></span>
						</a>
						<ul class="sub-menu">
							<li><a href="${path}administracao/servicos"> <spring:message code="nav.administracao.principal.servicos" /> </a></li>
							<li><a href="${path}administracao/servico/planos"> <spring:message code="nav.administracao.principal.servicos.planos" /> </a></li>
							<li><a href="${path}administracao/servico/funcionalidades"> <spring:message code="nav.administracao.principal.servicos.configuracao.funcionalidades" /> </a></li>
						</ul>
					</li>
					<li class="">
						<a href="javascript:;"> 
							<i class="fa fa-users"></i> 
							<span class="title"><spring:message code="nav.administracao.principal.acesso" /></span>
							<span class="arrow "></span>
						</a>
						<ul class="sub-menu">
							<li><a href="${path}administracao/acesso/usuarios"> <spring:message code="nav.administracao.principal.servicos.acesso.usuario" /> </a></li>
							<li><a href="${path}administracao/acesso/grupos"> <spring:message code="nav.administracao.principal.servicos.acesso.grupo" /> </a></li>
							<li><a href="${path}administracao/acesso/permissoes"> <spring:message code="nav.administracao.principal.servicos.acesso.permissao" /> </a></li>
							<li><a href="${path}administracao/acesso/historicos"> <spring:message code="nav.administracao.principal.servicos.acesso.historicos" /> </a></li>
						</ul>
					</li>
					<li class="">
						<a href="javascript:;"> 
							<i class="fa fa-credit-card"></i> 
							<span class="title"><spring:message code="nav.administracao.principal.vendas" /></span>
							<span class="arrow "></span>
						</a>
						<ul class="sub-menu">
							<li><a href="${path}administracao/vendas/cobranca"> <spring:message code="nav.administracao.principal.servicos.vendas.cobranca" /> </a></li>
							<li><a href="${path}administracao/vendas/planos"> <spring:message code="nav.administracao.principal.servicos.vendas.planos" /> </a></li>
							<li><a href="${path}administracao/vendas/financas"> <spring:message code="nav.administracao.principal.servicos.vendas.financas" /> </a></li>
						</ul>
					</li>
					<li class="">
						<a href="javascript:;"> 
							<i class="fa fa-cogs"></i> 
							<span class="title"><spring:message code="nav.administracao.principal.configuracao" /></span>
							<span class="arrow "></span>
						</a>
						<ul class="sub-menu">
							<li><a href="${path}administracao/configuracao/regras"> <spring:message code="nav.administracao.principal.servicos.configuracao.regras" /> </a></li>
							<li><a href="${path}administracao/configuracao/localizacao"> <spring:message code="nav.administracao.principal.servicos.configuracao.localizacao" /> </a></li>
						</ul>
					</li>
				</ul>
			</div>
			<a href="#" class="scrollup"><spring:message code="system.scroll" /></a>
			<div class="clearfix"></div>
		</div>
		<div class="footer-widget">
			<a href="${path}logout"><i class="fa fa-power-off"></i></a>
		</div>
	</div>
	<!-- End Menu -->
	<!-- Page Content -->
	<div class="page-content">
		<div class="content">
			<tiles:insertAttribute name="content" />
			<div class="row-fluid">
				<div class="col-lg-12">
					<p><spring:message code="system.copyright" /> </p>
				</div>
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

