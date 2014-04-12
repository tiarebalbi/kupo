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
	<li><a href="#" class="active"><spring:message code="nav.administracao.principal.servicos" /> </a></li>
</ul>
<div class="page-title">
	<i class="fa-key fa"></i>
	<h3>
		<spring:message code="nav.administracao.principal.servicos" />
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
					<span class="semi-bold"><spring:message code="system.form.title" /></span>
				</h3>
				<form:form  commandName="servico"  action="${path}administracao/servicos/salvar" >
					<div class="form-group">
						<label class="form-label"><spring:message code="servicos.input.nome"/> <span class="badge badge-important">(*)</span> </label> 
						<span class="help"><spring:message code="system.example" /> PMBOK&reg; Manager Project </span>
						<div class="input-with-icon  right">
							<spring:message code="validation.input.notnull" var="notnull" />
							<form:hidden path="id"/>
							<form:hidden path="version"/>
							<form:input path="nome" cssClass="form-control" placeholder="${notnull}" />
							<form:errors path="nome" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="servicos.input.status"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="input-with-icon  right">
							<form:select path="status" cssClass="form-control">
								<form:option value="true"><spring:message code="system.ativo" /> </form:option>
								<form:option value="false"><spring:message code="system.inativo" /> </form:option>
							</form:select>
							<form:errors path="nome" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-actions">
						<div class="pull-right">
							<button type="submit" class="btn btn-success btn-cons">
								<i class="icon-ok"></i> <spring:message code="system.save" />
							</button>
							<a href="${path}administracao/servicos" class="btn btn-white btn-cons"><spring:message code="system.cancel" /></a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
