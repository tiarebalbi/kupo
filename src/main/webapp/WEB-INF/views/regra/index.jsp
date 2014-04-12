<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<spring:url value="/" var="path"></spring:url>

<ul class="breadcrumb">
	<li>
		<p><spring:message code="system.breadcrumb.whereyouare" /> </p>
	</li>
	<li><a href="#" class="active"><spring:message code="nav.administracao.principal.servicos.configuracao" /> </a></li>
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
				<a href="${path}administracao/configuracao/regras/novo" class="btn btn-small btn-info"><i class="fa fa-plus"></i> <spring:message code="regras.btn.novo" /></a>
				<div class="tools">
					<a href="javascript:;" class="reload"></a>
				</div>
			</div>
			<!-- /.modal -->
			<div class="grid-body no-border">
				<h3>
					<spring:message code="regras.btn.listagem" /> <span class="semi-bold"><spring:message code="regras.btn.nome.plural" /></span>
				</h3>
				<table class="table no-more-tables table-striped">
					<thead>
						<tr>
							<th>#ID</th>
							<th><spring:message code="regras.btn.nome.singular" /></th>
							<th><spring:message code="system.table.options" /></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3">
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
						<td>{{this.attributes.regra}}</td>
						<td>
							<div class="btn-group"> 
								<a class="btn btn-info dropdown-toggle btn-small" data-toggle="dropdown" href="#"> ${opcoes} <span class="caret"></span> </a>
                    			<ul class="dropdown-menu">
                      				<li><a href="${path}administracao/configuracao/regras/editar/{{this.attributes.id}}"><i class='fa fa-edit'></i> Editar</a></li>
                      				<li class="divider"></li>
                      				<li><a href="${path}administracao/configuracao/regras/excluir/{{this.attributes.id}}"><i class='fa fa-minus-circle'></i> Excluir</a></li>
                    			</ul>
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
