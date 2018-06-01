<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">
	<c:set var="background" value="#FFF"/>
	<c:if test="${content.value.BackgroundColor.exists}">
		<c:set var="background" value="background-color: ${content.value.BackgroundColor};"/>
	</c:if>	
	<c:if test="${content.value.BackgroundImage.exists}">
		<c:set var="image" value="${content.value.BackgroundImage}"/>
		<c:set var="background" value="background-image:url('${image}'); background-repeat: no-repeat; background-attachment: fixed; background-position: center top;  no-repeat center top #FFF"/>
	</c:if>
	<div class="container-fluid caja_base" style="${background}">
		<a name="Ancla" id="${content.value.Identifier}"></a>
		<div class="headline">
			<h1 ${content.rdfa.Title}>${content.value.Title}</h1>
		</div>
		<div class="row">
			<div class="col-md 12" id="ab-box-${cms.element.id}">
				<c:forEach var="label" items="${content.valueList.Element}" varStatus="status">
					<!-- Pre contenedor elemento -->
					<cms:container  name="ab-box-container${status.count}" type="contenedor" maxElements="1">
						<!-- CONTENIDO -->
					</cms:container>
				</c:forEach>
			</div>
		</div>
	</div>
</cms:formatter>