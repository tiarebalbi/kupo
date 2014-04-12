<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<spring:url value="/" var="path"></spring:url>

<ul class="breadcrumb">
	<li>
		<p><spring:message code="system.breadcrumb.whereyouare" /> </p>
	</li>
	<li><a href="#" class="active"><spring:message code="nav.administracao.principal.cliente" /> </a></li>
</ul>
<div class="page-title">
	<i class="fa-flask fa"></i>
	<h3>
		<spring:message code="nav.administracao.principal.cliente.form" />
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
					<spring:message code="clientes.title.nova.cliente" /> <span class="semi-bold"><spring:message code="clientes.btn.nome.plural" /></span>
				</h3>
				<form:form  commandName="cliente"  action="${path}administracao/cliente/salvar" >

					<div class="form-group">
						<label class="form-label"><spring:message code="clientes.input.nome"/> <span class="badge badge-important">(*)</span> </label> 
						<span class="help"><spring:message code="system.example" /> Gantt-Chart</span>
						<div class="input-with-icon  right">
							<spring:message code="validation.input.notnull" var="notnull" />
							<form:hidden path="id"/>
							<form:hidden path="version"/>
							<form:input path="nome" cssClass="form-control" placeholder="${notnull}" />
							<form:errors path="nome" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="clientes.input.responsavel"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="right">
							<kendo:comboBox name="responsavel" template="#= nome # #= sobrenome # - #= email #" dataTextField="nome" class="kendo" dataValueField="id" filter="startwith" autoBind="false" style="width: 250px;" minLength="1" value="${cliente.responsavel.nome}">
					            <kendo:dataSource serverFiltering="true">
					                <kendo:dataSource-transport>
					                   <kendo:dataSource-transport-read url="${path}api/usuario/kendo" dataType="json" type="POST" contentType="application/json"/>
					                   <kendo:dataSource-transport-parameterMap>
						                	<script>
							                	function parameterMap(options) {
							                		return JSON.stringify(options);
							                	}
						                	</script>
						                </kendo:dataSource-transport-parameterMap>
					                </kendo:dataSource-transport>
					                <kendo:dataSource-schema data="data" total="total">
					                </kendo:dataSource-schema>
					            </kendo:dataSource>
					        </kendo:comboBox>
							<form:errors path="responsavel" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="clientes.input.status"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="input-with-icon  right">
							<div class="radio radio-success">
								<input id="yes" type="radio" name="status" value="yes">
								<form:radiobutton path="status" value="true" id="sim" checked="checked"/>
								<label for="sim"><spring:message code="clientes.inputs.true" /></label> 
								<form:radiobutton path="status" value="false" id="nao" /> 
								<label for="nao"><spring:message code="clientes.inputs.false" /></label>
							</div>
							<form:errors path="status" cssClass="label label-important"></form:errors>
						</div>
					</div>
					
					
					
					<div class="form-actions">
						<div class="pull-right">
							<button type="submit" class="btn btn-success btn-cons">
								<i class="icon-ok"></i> <spring:message code="system.save" />
							</button>
							<a href="${path}administracao/cliente" class="btn btn-white btn-cons"><spring:message code="system.cancel" /></a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
