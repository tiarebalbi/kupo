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
		<spring:message code="nav.administracao.principal.cliente.empresa" />
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
				<a href="${path}administracao/cliente/empresa/novo" class="btn btn-small btn-info"><i class="fa fa-plus"></i> <spring:message code="empresa.btn.novo" /></a>
				<div class="tools">
					<a href="javascript:;" class="reload"></a>
				</div>
			</div>
			<!-- /.modal -->
			<div class="grid-body no-border">
				<h3>
					<spring:message code="empresa.btn.listagem" /> <span class="semi-bold"><spring:message code="empresa.btn.nome.plural" /></span>
				</h3>
				<table class="table no-more-tables table-striped">
					<thead>
						<tr>
							<th>#ID</th>
							<th><spring:message code="empresa.btn.nome.singular" /></th>
							<th><spring:message code="empresa.column.telefone" /></th>
							<th><spring:message code="empresa.column.site" /></th>
							<th><spring:message code="empresa.column.cliente" /></th>
							<th><spring:message code="system.table.options" /></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">
								<spring:message code="system.table.empty" />
							</td>
						</tr>
					</tbody>
				</table>
				<spring:message code="system.opcoes" var="opcoes" />
				<script id="data-template" type="text/x-handlebars-template">
				{{#each []}}
					<tr data-line-id="{{this.attributes.id}}">
						<td>{{this.attributes.id}}</td>
						<td>{{this.attributes.razaoSocial}}</td>
						<td>{{this.attributes.telefone.fixo}}</td>
						<td>{{this.attributes.site}}</td>
						<td>{{this.attributes.cliente.nome}}</td>
						<td>
							<div class="btn-group"> 
								<a class="btn btn-info dropdown-toggle btn-small" data-toggle="dropdown" href="#"> ${opcoes} <span class="caret"></span> </a>
                    			<ul class="dropdown-menu">
                      				<li><a href="${path}administracao/cliente/empresa/editar/{{this.attributes.id}}"><i class='fa fa-edit'></i> Editar</a></li>
                      				<li class="divider"></li>
                      				<li><a href="#confirmacao-{{this.attributes.id}}" data-toggle="modal"><i class='fa fa-minus-circle'></i> Excluir</a></li>
                    			</ul>
                  			</div>
							<div class="modal fade" id="confirmacao-{{this.attributes.id}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											<i class="fa-question-circle fa-5x fa"></i>
											<div class="page-title">
												<h4 id="myModalLabel" class="semi-bold"><spring:message code="system.event.confirmacao.exclusao" /></h4>
												<p>
													<spring:message code="validation.action.delete.event.modal" />
												</p>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="usuario.btn.cancel" /></button>
											<a href="${path}administracao/cliente/empresa/excluir/{{this.attributes.id}}" class="btn btn-danger destroy"> <spring:message code="usuario.btn.destroy" /> </a>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
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
