<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url value="/" var="path"></spring:url>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" data-aria-hidden="true">×</button>
			<h4 id="myModalLabel" class="semi-bold"> <spring:message code="empresa.form.title" /> </h4>
			<p class="no-margin">
				<spring:message code="system.warning.form.inputs" />
			</p>
		</div>
		<form action="${path}api/empresa" method="post" class="form-empresa">
			<div class="modal-body">
				<div class="row form-row">
					<div class="col-md-12 notification-form">
					</div>
				</div>
				<div class="row form-row">
					<div class="col-md-12">
						<spring:message var="razaoSocial" code="empresa.form.razao" />
						<input type="text" class="form-control" name="razaoSocial" placeholder="${razaoSocial}" required="required">
					</div>
				</div>
				<div class="row form-row">
					<div class="col-md-6">
						<spring:message var="cnpj" code="empresa.form.cnpj" />	
						<input type="text" class="form-control" name="documentacao[cnpj]" placeholder="${cnpj}">
					</div>
					<div class="col-md-6">
						<spring:message var="ie" code="empresa.form.ie" />
						<input type="text" class="form-control" name="documentacao[ie]" placeholder="${ie}">
					</div>
				</div>
				<div class="row form-row">
					<div class="col-md-12">
						<spring:message var="site" code="empresa.form.site" />
						<input type="text" class="form-control" name="site" placeholder="${site}">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="system.cancel" /></button>
				<spring:message code="system.save" var="titleSubmitInput" />
				<input type="submit" class="btn btn-primary" value="${titleSubmitInput }" />
			</div>
		</form>
	</div>
	<!-- /.modal-content -->
</div>