<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value="${cms.locale}" />
<cms:bundle basename="es.uva.web.portal.ambassador.flexible">
<cms:formatter var="content">
<div class="flexible">
<!--<div class="container">-->
	<c:set var="hasScript" value="${fn:contains(fn:toLowerCase(value.Code), 'script')}" />
	<c:if test="${not cms.element.settings.hideTitle}">
		<div class="row">
			<div class="col-md-12">
				<div class="headline"><h3 ${rdfa.Title}>${value.Title}</h3></div>
			</div>
		</div>
    </c:if>
	<c:out value="${content.value.Code}" escapeXml="false" />
<!-- </div> -->
</div>
</cms:formatter>
</cms:bundle>