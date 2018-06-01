<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">
<fmt:setLocale value="${cms.locale}" />
<cms:bundle basename="es.uva.web.portal.ambassador.navigation.messages">
	<c:set var="navStartLevelStr" value="${content.value.NavStartLevel}"/>
	<c:set var="navStartLevel" value="${navStartLevelStr.toInteger < 0 ? 0 : navStartLevelStr.toInteger}" />
	<c:set var="navDepth" value="${content.value.NavDepth.isSet ? (content.value.NavDepth.toInteger < 0 ? 0 : content.value.NavDepth.toInteger) : 3}" />
	<c:set var="endLevel" value="${navStartLevel + navDepth - 1}" />
	<c:if test="${type eq 'breadCrumb'}">
		<c:set var="endLevel" value="-1" />
		<c:set var="navStartLevel" value="${navStartLevel + 1}" />
	</c:if>

	<c:set var="navStartFolder" value="/" />
	<c:if test="${content.value.NavFolder.isSet}" >
		<c:choose>
		<c:when test="${fn:endsWith(content.value.NavFolder.toString.concat('X'), '/X')}">
			<c:set var="navStartFolder" value="${content.value.NavFolder.toString}" />
		</c:when>
		<c:otherwise>
			<c:set var="navStartFolder" value="INVALID" />
		</c:otherwise>
		</c:choose>
	</c:if>
	
	<c:if test="${navStartFolder ne 'INVALID'}">

		<c:choose>
			<c:when test="${type eq 'forSite'}">
				<c:set var="pathparts" value="${fn:split(currentPageFolder, '/')}" />
				<c:forEach var="folderName" items="${pathparts}" varStatus="status">
					<c:if test="${status.count <= navStartLevel}">
						<c:set var="navStartFolder">${navStartFolder}${folderName}/</c:set>
					</c:if>
				</c:forEach>
			</c:when>
			<c:when test="${type eq 'breadCrumb'}">
				<c:set var="navStartFolder" value="${currentPageFolder}" />
			</c:when>
		</c:choose>

		<cms:navigation
			type="forFolder"
			resource="${navStartFolder}"
			startLevel="${navStartLevel}"
			endLevel="${endLevel}"
			locale="${cms.locale}"
			param="true"
			var="nav" />
			
		<c:set var="navLength" value="${fn:length(nav.items) - 1}" />
		<c:if test="${navLength > 0}">
			<ul class="nav navbar-nav">
				<c:forEach var="i" begin="0" end="${navLength}" >
					<c:set var="navElem" value="${nav.items[i]}" />
					<c:set var="nextLevel" value="${i < navLength ? nav.items[i+1].navTreeLevel : navStartLevel}" />
					<c:set var="startSubNav" value="${nextLevel > navElem.navTreeLevel}" />
					<c:set var="isFirstLevel" value="${navElem.navTreeLevel eq navStartLevel}" />
					<c:set var="nextIsFirstLevel" value="${nextLevel eq navStartLevel}" />
					<c:set var="navLink"><cms:link>${navElem.resourceName}</cms:link></c:set>
					<c:set var="isCurrentPage" value="${navElem.navigationLevel ?
													  fn:startsWith(cms.requestContext.uri, navElem.parentFolderName) :
													  fn:startsWith(cms.requestContext.uri, navElem.resourceName)}" />
					
					<li <c:if test="${isCurrentPage==true}">class="current"</c:if>><c:out value='<a href="${navLink}">${navElem.navText}</a> ' escapeXml="false" /></li>


				</c:forEach>
			</ul>
		</c:if>
		<c:if test="${navLength == -1}">
			<h2>
			No puede navegar
			</h2>
		</c:if>
	</c:if>
</cms:bundle>
</cms:formatter>