<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url value="/" var="path"></spring:url>

<ul class="breadcrumb">
	<li>
		<p><spring:message code="system.breadcrumb.whereyouare" /> </p>
	</li>
	<li><a href="#" class="active"><spring:message code="nav.administracao.principal.servicos.configuracao.regras" /> </a></li>
</ul>
<div class="page-title">
	<i class="fa-key fa"></i>
	<h3>
		<spring:message code="nav.administracao.principal.configuracao.regras" />
	</h3>
</div>
<c:if test="${mensagem != null}">
	<div class="alert ${status}">
		${mensagem}
	</div>
</c:if>
<div class="row">
	<div class="col-md-12">
		<div class="grid simple ">
			<div class="grid-title no-border">
			</div>
			<!-- /.modal -->
			<div class="grid-body no-border">
				<h3>
					<spring:message code="regras.title.nova.regra" /> <span class="semi-bold"><spring:message code="regras.btn.nome.singular" /></span>
				</h3>
				<form:form  commandName="regra"  action="${path}administracao/configuracao/regras/salvar" >

					<div class="form-group">
						<label class="form-label"><spring:message code="regras.btn.nome.singular"/> <span class="badge badge-important">(*)</span> </label> 
						<span class="help"><spring:message code="system.example" /> ROLE_FUNCTION_LER</span>
						<div class="input-with-icon  right">
							<spring:message code="validation.input.notnull" var="notnull" />
							<form:hidden path="id"/>
							<form:hidden path="version"/>
							<form:input path="regra" cssClass="form-control" placeholder="${notnull}" />
							<form:errors path="regra" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-actions">
						<div class="pull-right">
							<button type="submit" class="btn btn-success btn-cons">
								<i class="icon-ok"></i> <spring:message code="system.save" />
							</button>
							<a href="${path}administracao/configuracao/regras" class="btn btn-white btn-cons"><spring:message code="system.cancel" /></a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
