<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<spring:url value="/" var="path"></spring:url>
<div class="row-fluid">
	<div class="dynamic-content"></div>
	<sec:authorize access="hasAnyRole('ROLE_EMPRESA_SALVAR','ROLE_ROOT')">
		<div class="col-lg-3 m-b-10">
			<div class="row">
				<div class="col-lg-12">
						<a class="text-center box-new border-grey" href="#nova"> <i class="fa fa-plus fa-5x text-grey"></i> </a>	
				</div>
			</div>
		</div>
	</sec:authorize>
	<script id="data-template" type="text/x-handlebars-template">
		{{#each []}}
		<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
			<div class="row tiles-container tiles white m-b-20">
          		<div class="col-lg-12 b-grey b-r ">
            		<h4 class="semi-bold m-b-10 p-l-5 p-b-10 b-grey b-b col-lg-9 "> {{this.attributes.razaoSocial}} </h4>
            		<h4 class="semi-bold m-b-10 p-l-5 p-b-10 b-grey b-b col-lg-3 hidden-xs hidden-sm hidden-md"> <a href="#" class="fa-edit fa p-l-40"></a> <a class="fa-cog fa" href="#"></a></h4>
            		<div class="b-grey b-b">
	              		<div class="row m-t-10 m-b-10">
    	            		<div class="col-lg-3  hidden-xs hidden-sm hidden-md">
                				<i class="fa fa-building-o fa-5x"></i>
                			</div>
                			<div class="col-lg-9  col-md-12 col-sm-12 col-xs-12">
								<div class="row m-t-10">
									<div class="col-lg-4">
										<p class="bold text-black">Responsável</p>
									</div>
									<div class="col-lg-8">
										<p class="text-black">
											Tiarê Balbi Bonamini
										</p>
									</div>
								</div>
								<div class="row m-t-10">
									<div class="col-lg-4">
										<p class="bold text-black">Site</p>
									</div>
									<div class="col-lg-8">
										<p class="text-black">
											www.empresa.com.br
										</p>
									</div>
								</div>
								<div class="row m-t-10">
									<div class="col-md-4">
										<p class="bold text-black">Status</p>
									</div>
									<div class="col-md-8">
										<p class="text-success">
											Ativo
										</p>
									</div>
								</div>
							</div>
        	      		</div>
            		</div>
            		<div class="row ">
            			<div class="col-lg-12 m-b-20">
	            			<a class="btn btn-block btn-grey m-t-10" href="#empresa/{{this.attributes.id}}">Acessar</a>
    	        		</div>
        	    	</div>
            		<div class="row ">
						<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 no-padding">
							<div class="tiles green">
								<div class="tiles-body">
									<span class="text-white">Total de Funcionário(s)</span>
									<h3 class="text-white bold "><span data-animation-duration="1000" data-value="245" class="animate-number">...</span></h3>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 no-padding">
							<div class="tiles blue">
								<div class="tiles-body">
									<span class="text-white">Total de Projeto(s)</span>
									<h3 class="text-white bold "><span data-animation-duration="1000" data-value="3" class="animate-number">...</span></h3>
								</div>
							</div>
						</div>
					</div>
    	      	</div>
       		</div>
		</div>
	{{/each}}
	</script>
	<div class="modal in fade" id="dynamicModal"></div>
</div>