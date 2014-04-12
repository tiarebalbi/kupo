<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<spring:url value="/" var="path"></spring:url>
<div class="col-md-7 col-md-offset-2 tiles white no-padding">
	<c:if test="${errorMessage != null}">
		<div class="alert alert-error">
			${errorMessage}
		</div>
	</c:if>
	<div class="p-t-30 p-l-40 p-b-20 xs-p-t-10 xs-p-l-10 xs-p-b-10"> 
		<h2 class="normal"><spring:message code="login.titulo" /> </h2>
		<p><spring:message code="login.titulo.descricao" /><br></p>
		<p class="p-b-20"><spring:message code="login.slogan" /></p>
		<button type="button" class="btn btn-info btn-cons" id="register_toggle"> <spring:message code="login.botoes.registrar" /></button>
	</div>
	<div class="tiles grey p-t-20 p-b-20 text-black">
		<form id="frm_login" class="animated fadeIn" action="${path}auth-verify" method="post">
			<div class="row form-row m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
				<div class="col-md-6 col-sm-6 ">
					<spring:message code="login.form.label.username" var="username" />
					<input type="text" name="kupo_username" required="required" class="form-control" placeholder="${username}" value="${kupo_username}">
				</div>
				<div class="col-md-6 col-sm-6">
					<spring:message code="login.form.label.password" var="pass" />
					<input type="password" name="kupo_password" required="required" class="form-control" placeholder="${pass}"> 
				</div>
			</div>
			<div class="row p-t-10 m-l-20 m-r-20 xs-m-l-10 xs-m-r-10">
					<div class="col-md-3 col-sm-3">
						<button type="submit" class="btn btn-primary btn-cons" id="login_toggle"><spring:message code="login.botoes.login" /> </button>
					</div>
					<div class="col-md-9 col-sm-9">
						<div class="checkbox checkbox check-success" style="line-height: 35px;"> <a href="#"><spring:message code="login.botoes.recover" /> </a>&nbsp;&nbsp;
						  	<input type="checkbox" id="kupo-remember" name="kupo-remember" value="1">
						  	<label for="checkbox1"><spring:message code="login.botoes.rememberme" /> </label>
						</div>
					</div>
				</div>
		</form>
	</div>
</div>