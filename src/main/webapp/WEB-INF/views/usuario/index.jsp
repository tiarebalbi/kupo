<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<spring:url value="/" var="path"></spring:url>

<ul class="breadcrumb">
	<li>
		<p><spring:message code="system.breadcrumb.whereyouare" /> </p>
	</li>
	<li><a href="#" class="active"><spring:message code="nav.administracao.principal.acesso" /> </a></li>
</ul>
<div class="page-title">
	<i class="fa-users fa"></i>
	<h3>
		<spring:message code="nav.administracao.principal.servicos.acesso.usuario" />
	</h3>
</div>
<div class="notification-panel"></div>
<div class="row usuario-crud-backbone">
	<div class="col-md-12">
		<div class="grid simple ">
			<div class="grid-title no-border">
				<a href="#novo-usuario" data-toggle="modal"  class="btn btn-small btn-info">Novo Usuário</a>
				<div class="tools">
					<a href="#grid-config" data-toggle="modal" class="config"></a> 
					<a href="javascript:;" class="reload"></a>
				</div>
			</div>
			<div class="modal fade" id="confirmacao-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<i class="fa-question-circle fa-5x fa"></i>
							<div class="page-title">
								<h4 id="myModalLabel" class="semi-bold"><spring:message code="usuario.event.confirmacao.exclusao" /></h4>
								<p>
									<spring:message code="validation.action.delete.event.modal" />
								</p>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="usuario.btn.cancel" /></button>
							<button type="button" class="btn btn-danger destroy"> <spring:message code="usuario.btn.destroy" /> </button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<div class="modal fade" id="novo-usuario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close reset" data-dismiss="modal" aria-hidden="true">×</button>
							<i class="fa-user fa-4x fa"></i>
                       		<div class="page-title">
								<h4 id="myModalLabel" class="semi-bold"><spring:message code="usuario.event.novo.usuario" /></h4>
								<p><spring:message code="usuario.alert.input.required" /> <span class="badge badge-important">(*)</span></p>
							</div>
							<div class="notification-form"></div>
                     	</div>
                     	<div class="modal-body data-usuario">
                       		<div class="row form-row">
                         		<div class="col-md-6">
                         			<spring:message code="usuario.input.nome" var="inputNome" />
                           			<input type="text" name="nome" class="form-control" placeholder="${inputNome}">
                        		</div>
                        		<div class="col-md-6">
                        			<spring:message code="usuario.input.sobrenome" var="inputSobrenome" />
                           			<input type="text" name="sobrenome" class="form-control" placeholder="${inputSobrenome}">
                         		</div>
                       		</div>
                       		<div class="row form-row">
                         		<div class="col-md-12">
                         			<spring:message code="usuario.input.email" var="inputEmail" />
                           			<input type="email" name="email" class="form-control" placeholder="${inputEmail}">
                         		</div>
	                       	</div>
	                       	<div class="row form-row">
	                       		<div class="col-md-6">
	                       			<spring:message code="usuario.input.login" var="inputLogin" />
                           			<input type="text" name="login" class="form-control" placeholder="${inputLogin}">
                         		</div>
                         		<div class="col-md-6">
                         			<spring:message code="usuario.input.senha" var="inputSenha" />
                           			<input type="password" name="senha" class="form-control" placeholder="${inputSenha}">
                         		</div>
	                       	</div>
	                       	<div class="row form-row">
	                       		<div class="col-md-6">
	                       			<spring:message code="usuario.input.tipo" var="inputTipo" />
                           			<label class="label-control">${inputTipo}</label>
                           			<select name="tipo" class="form-control">
                           				<c:forEach items="${tipos}" var="tipo">
											<option value="${tipo}">${tipo.nome}</option>                           				
                           				</c:forEach>
                           			</select>
                         		</div>
                         		<div class="col-md-6">
                         			<spring:message code="usuario.input.idioma" var="inputIdioma" />
                         			<label class="label-control">${inputIdioma}</label>
                           			<select name="idioma" class="form-control">
                           				<c:forEach items="${idiomas}" var="idioma">
											<option value="${idioma}">${idioma.nome}</option>                           				
                           				</c:forEach>
                           			</select>
                         		</div>
	                       	</div>
	                       	<div class="row form-row">
	                       		<div class="col-md-12">
	                       			<spring:message code="usuario.input.status" var="inputStatus" />
	                       			<label class="label-control">${inputStatus}</label>
									<select name="status" class="form-control">
										<spring:message code="system.ativo" var="ativo" />
										<option value="true">${ativo}</option>
										<spring:message code="system.inativo" var="inativo" />
										<option value="false">${inativo}</option>
                           			</select>
                         		</div>
	                       	</div>
                     	</div>
                     	<div class="modal-footer">
                       		<button type="button" class="btn btn-default reset" data-dismiss="modal"><spring:message code="system.cancel" /> </button>
                       		<button type="button" class="btn btn-primary salvar"><spring:message code="system.save" /></button>
                    	</div>
                   	</div>
                   	<!-- /.modal-content -->
				</div>
                <!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<div class="grid-body no-border">
				<h3>
					Lista de <span class="semi-bold">Usuários</span>
				</h3>
				<table class="table no-more-tables table-striped">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Sobrenome</th>
							<th>E-Mail</th>
							<th>Login</th>
							<th>Opções</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<script id="data-template" type="text/x-handlebars-template">
				{{#each []}}
					<tr data-line-id="{{this.attributes.id}}">
						<td>{{this.attributes.nome}}</td>
						<td>{{this.attributes.sobrenome}}</td>
						<td>{{this.attributes.email}}</td>
						<td>{{this.attributes.login}}</td>
						<td>
							<a href="#confirmacao-delete" data-toggle="modal" class="remove btn btn-small btn-danger" data-id="{{this.attributes.id}}" id="record-{{this.attributes.id}}">Excluir</a>
						</td>
					</tr>
				{{/each}}
				</script>
				<div class="btn-group pagination">
				</div>
				
				
				<script id="pagination-template" type="text/x-handlebars-template">
					{{#if firstPage}}
						<button class="btn btn-white first-page disabled" type="button">
							<i class="fa fa-chevron-left"></i>
						</button>
					{{else}}
						<button class="btn btn-white first-page" type="button">
							<i class="fa fa-chevron-left"></i>
						</button>
					{{/if}}
					{{#each paginas}}
						{{#compare this "==" ../ativa}}
  							<button class="btn btn-white active page disabled" type="button">
								{{this}}
							</button>
						{{else}}
							<button class="btn btn-white page" type="button">
								{{this}}
							</button>
						{{/compare}}
					{{/each}}
					{{#if lastPage}}
						<button class="btn btn-white last-page disabled" type="button">
							<i class="fa fa-chevron-right"></i>
						</button>
					{{else}}
						<button class="btn btn-white last-page" type="button">
							<i class="fa fa-chevron-right"></i>
						</button>
					{{/if}}
				</script>
			</div>
		</div>
	</div>
</div>
