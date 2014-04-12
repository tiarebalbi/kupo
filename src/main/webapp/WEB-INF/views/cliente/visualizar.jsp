<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<spring:url value="/" var="path"></spring:url>

<ul class="breadcrumb">
	<li>
		<p><spring:message code="system.breadcrumb.whereyouare" /> </p>
	</li>
	<li><a href="#" class="active"><spring:message code="nav.administracao.principal.clientes" /> </a></li>
</ul>
<div class="page-title">
	<i class="fa-flask fa"></i>
	<h3>
		<spring:message code="nav.administracao.principal.clientes.visualizacao" arguments="${cliente.nome}" />
	</h3>
</div>
<c:if test="${mensagem != null}">
	<div class="alert ${status}">
		${mensagem}
	</div>
</c:if>
<div class="clearfix"></div>
<!-- Botões -->
<div class="row">
	<div class="col-lg-12 spacing-bottom-sm spacing-bottom">
		<a class="btn btn-danger btn-cons" href="${path}administracao/cliente"> <span class="fa fa-arrow-left"></span> <spring:message code="system.voltar" /> </a>
		<a class="btn btn-primary btn-cons" href="${path}administracao/cliente/editar/${cliente.id}"> <span class="fa fa-edit"></span> <spring:message code="system.editar" /> </a>
	</div>
</div>

<div class="clearfix"></div>

<div class="row spacing-bottom 2col">
	
	<div class="col-md-6 col-lg-6">
		<div class="grid simple horizontal green">
			<div class="grid-title ">
				<h4><spring:message code="clientes.dashboard.empresa" /> </h4>
			</div>
			<div class="grid-body">
				<h4><i><spring:message code="clientes.dashboard.alert.empty" /> </i></h4>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-lg-6">
		<div class="grid simple horizontal green">
			<div class="grid-title ">
				<h4><spring:message code="clientes.dashboard.projetos" /> </h4>
			</div>
			<div class="grid-body">
				<h4><i><spring:message code="clientes.dashboard.alert.empty" /> </i></h4>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-lg-6">
		<div class="grid simple horizontal red">
			<div class="grid-title ">
				<h4><spring:message code="clientes.dashboard.grupos" /> </h4>
			</div>
			<div class="grid-body">
				<h4><i><spring:message code="clientes.dashboard.alert.empty" /> </i></h4>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-lg-6">
		<div class="grid simple horizontal red">
			<div class="grid-title ">
				<h4><spring:message  code="clientes.dashboard.funcionarios"/> </h4>
			</div>
			<div class="grid-body">
				<h4><i><spring:message code="clientes.dashboard.alert.empty" /> </i></h4>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-lg-6">
		<div class="grid simple horizontal purple">
			<div class="grid-title ">
				<h4><spring:message  code="clientes.dashboard.cobrancas"/> </h4>
			</div>
			<div class="grid-body">
				<h4><i><spring:message code="clientes.dashboard.alert.empty" /> </i></h4>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-lg-6">
		<div class="grid simple horizontal purple">
			<div class="grid-title ">
				<h4><spring:message  code="clientes.dashboard.plano"/> </h4>
			</div>
			<div class="grid-body">
				<h4><i><spring:message code="clientes.dashboard.alert.empty" /> </i></h4>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-12">
		<div class="grid simple horizontal green">
			<div class="grid-title ">
				<h4> <spring:message code="clientes.dashboard.estrutura.organizacional" /> </h4>
			</div>
			<div class="grid-body">
				<h4><i><spring:message code="clientes.dashboard.alert.empty" /> </i></h4>
			</div>
		</div>
	</div>
</div>
