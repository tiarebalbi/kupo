<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<spring:url value="/resources/theme/" var="pathFile"></spring:url>
<spring:url value="/" var="path"></spring:url>

<tiles:importAttribute name="required"/>
<c:if test="${required == 'sim'}">
	<tiles:importAttribute name="module" />
	<script type="text/javascript">
		requirejs([ "${module}" ]);
	</script>
</c:if>
<tiles:insertAttribute name="content" />