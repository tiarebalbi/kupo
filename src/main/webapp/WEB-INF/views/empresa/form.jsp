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
	<li><a href="#" class="active"><spring:message code="nav.administracao.principal.clientes" /> </a></li>
</ul>
<div class="page-title">
	<i class="fa-flask fa"></i>
	<h3>
		<spring:message code="nav.administracao.principal.cliente.empresa.form" />
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
					<spring:message code="empresa.title.nova.empresa" /> <span class="semi-bold"><spring:message code="empresa.btn.nome.singular" /></span>
				</h3>
				<form:form  commandName="empresa"  action="${path}administracao/cliente/empresa/salvar" >

					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.nome"/> <span class="badge badge-important">(*)</span> </label> 
						<span class="help"><spring:message code="system.example" /> Gantt-Chart</span>
						<div class="input-with-icon  right">
							<spring:message code="validation.input.notnull" var="notnull" />
							<form:hidden path="id"/>
							<form:hidden path="version"/>
							<form:input path="razaoSocial" cssClass="form-control" placeholder="${notnull}" />
							<form:errors path="razaoSocial" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.documentacao"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="input-with-icon  right">
							<form:input path="documentacao.cnpj" cssClass="form-control" placeholder="${notnull}" />
							<form:errors path="documentacao.cnpj" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.ie"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="input-with-icon  right">
							<form:input path="documentacao.ie" cssClass="form-control" placeholder="${notnull}" />
							<form:errors path="documentacao.ie" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.telefone.fixo"/> </label> 
						<div class="input-with-icon  right">
							<form:input path="telefone.fixo" data-plugin="mask" data-mask="(99) 9999-9999" cssClass="form-control" />
							<form:errors path="telefone.fixo" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.telefone.fixo.ramal"/> </label> 
						<div class="input-with-icon  right">
							<form:input path="telefone.ramalTelefone" cssClass="form-control" />
							<form:errors path="telefone.ramalTelefone" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.telefone.fax"/> </label> 
						<div class="input-with-icon  right">
							<form:input path="telefone.fax" data-plugin="mask" data-mask="(99) 9999-9999" cssClass="form-control" />
							<form:errors path="telefone.fax" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.telefone.celular"/> </label> 
						<div class="input-with-icon  right">
							<form:input path="telefone.celular" data-plugin="mask" data-mask="(99) 99999999?9" cssClass="form-control" />
							<form:errors path="telefone.celular" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.site"/></label> 
						<div class="input-with-icon  right">
							<form:input path="site" cssClass="form-control" />
							<form:errors path="site" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.endereco.cep"/></label> 
						<div class="input-with-icon  right">
							<form:input path="endereco.cep" cssClass="form-control" id="cep" data-plugin="mask" data-mask="99999-999"/>
							<form:errors path="endereco.cep" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.endereco.endereco"/></label> 
						<div class="input-with-icon  right">
							<form:input path="endereco.endereco" cssClass="form-control" id="endereco" />
							<form:errors path="endereco.endereco" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.endereco.bairro"/></label> 
						<div class="input-with-icon  right">
							<form:input path="endereco.bairro" cssClass="form-control" id="bairro" />
							<form:errors path="endereco.bairro" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.endereco.numero"/></label> 
						<div class="input-with-icon  right">
							<form:input path="endereco.numero" cssClass="form-control" />
							<form:errors path="endereco.numero" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.endereco.complemento"/></label> 
						<div class="input-with-icon  right">
							<form:input path="endereco.complemento" cssClass="form-control" />
							<form:errors path="endereco.complemento" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.cliente"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="right">
							<kendo:comboBox name="cliente" style="width: 30%;" class="kendo" dataTextField="nome" dataValueField="id" filter="startswith" value="${empresa.cliente.nome}" placeholder="${notnull}">
					            <kendo:dataSource serverFiltering="true">
					                <kendo:dataSource-transport>
					                   <kendo:dataSource-transport-read url="${path}api/cliente/kendo" type="POST" dataType="json" contentType="application/json"/>
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
							<form:errors path="cliente" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.pais"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="right">
							<kendo:comboBox name="endereco.pais" style="width: 30%;" class="kendo" id="pais" dataTextField="nome" template="#= nome # [#= sigla #]" dataValueField="id" filter="startswith" value="${empresa.endereco.pais.nome}" placeholder="${notnull}">
					            <kendo:dataSource serverFiltering="true">
					                <kendo:dataSource-transport>
					                   <kendo:dataSource-transport-read url="${path}api/pais/kendo" type="POST" dataType="json" contentType="application/json"/>
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
							<form:errors path="cliente" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.estado"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="right">
							<kendo:comboBox name="endereco.estado" cascadeFrom="pais" style="width: 30%;" class="kendo" id="estado" dataTextField="nome" template="#= nome # [#= sigla #]" dataValueField="id" filter="startswith" value="${empresa.endereco.estado.nome}" placeholder="${notnull}">
					            <kendo:dataSource serverFiltering="true">
					                <kendo:dataSource-transport>
					                   <kendo:dataSource-transport-read url="${path}api/estado/kendo" type="POST" dataType="json" contentType="application/json"/>
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
							<form:errors path="cliente" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.cidade"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="right">
							<kendo:comboBox name="endereco.cidade" cascadeFrom="estado" style="width: 30%;" class="kendo" id="cidade" dataTextField="nome" template="#= nome # [#= estado.nome #]" dataValueField="id" filter="startswith" value="${empresa.endereco.cidade.nome}" placeholder="${notnull}">
					            <kendo:dataSource serverFiltering="true">
					                <kendo:dataSource-transport>
					                   <kendo:dataSource-transport-read url="${path}api/cidade/kendo" type="POST" dataType="json" contentType="application/json"/>
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
							<form:errors path="cliente" cssClass="label label-important"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label"><spring:message code="empresa.input.status"/> <span class="badge badge-important">(*)</span> </label> 
						<div class="input-with-icon  right">
							<div class="radio radio-success">
								<input id="yes" type="radio" name="status" value="yes">
								<form:radiobutton path="status" value="true" id="sim" checked="checked"/>
								<label for="sim">Ativo</label> 
								<form:radiobutton path="status" value="false" id="nao" /> 
								<label for="nao">Inativo</label>
							</div>
							<form:errors path="status" cssClass="label label-important"></form:errors>
						</div>
					</div>
					
					
					
					<div class="form-actions">
						<div class="pull-right">
							<button type="submit" class="btn btn-success btn-cons btn-save">
								<i class="icon-ok"></i> <spring:message code="system.save" />
							</button>
							<a href="${path}administracao/cliente/empresa" class="btn btn-white btn-cons"><spring:message code="system.cancel" /></a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
