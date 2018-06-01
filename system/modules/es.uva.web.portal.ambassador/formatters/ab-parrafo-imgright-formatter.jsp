<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value="${cms.locale}" />
<cms:bundle basename="es.uva.web.portal.ambassador.parrafo">
<cms:formatter var="content" val="value" rdfa="rdfa">
<c:if test="${not cms.element.settings.destacado}">
	<div class="container parrafo fondo_blanco" style="margin-top: 15px;">
		<%--

	/* Semanticamente habria que ve, segun como escriban en un futuro
	como consideramos esto. Así pueden ser secciones (section) del article
	principal, o lo dejamos como un article generico el container gordo
	y vemos si asi, el significado es el correcto

	Por depronto, no metemos el section (con los header correspondientes, semanticos)
	que mas vale de poco que de mucho y mal */

	--%>
		<c:set var="elementos_total" value="0"/>
		<c:if test="${!content.valueList.Paragraph.isEmpty()}">
			<fmt:parseNumber var="elementos_total" integerOnly="true" type="number" value="${(12/fn:length(content.valueList.Paragraph)/10)}" />
		</c:if>
		<c:if test="${not cms.element.settings.hideTitle}">
			<div class="headline"><h1 ${rdfa.Title}>${value.Title}</h1></div>
		</c:if>
		<div class="row">

			<c:forEach var="paragraph" items="${content.valueList.Paragraph}">

				<div class="col-md-${elementos_total}">


					<c:if test="${paragraph.value.Headline.isSet}">
						<div class="headline"><h2 ${paragraph.rdfa.Headline}>${paragraph.value.Headline}</h2></div>
					</c:if>

					<div  ${paragraph.rdfa["Link|Image"]}>
						<c:if test="${elementos_total == 12}">
						<div class="row">
						</c:if>
							<div class="<c:choose><c:when test="${paragraph.value.Image.exists}">col-md-8 col-sm-10 col-xs-12</c:when><c:otherwise>col-xs-12</c:otherwise></c:choose>">
								<div ${paragraph.rdfa.Text}>
									<p>
										${paragraph.value.Text}
									</p>
								</div>		
								<c:if test="${paragraph.value.Link.exists}">
									<div class="leer_mas">
										<a href="<cms:link>${paragraph.value.Link.value.URI}</cms:link>" role="link" aria-label="Enlace a ${paragraph.value.Link.value.URI}">${paragraph.value.Link.value.Text}</a>
									</div>
								</c:if>		
							</div>
							<c:if test="${paragraph.value.Image.exists}">
								<div class="col-md-4 col-sm-2 hidden-xs">
									<div class="thumbnail-kenburn"><div class="overflow-hidden">
										<figure><cms:img src="${paragraph.value.Image.value.Image}" scaleColor="transparent" width="400" scaleType="0" noDim="true" cssclass="img-fluid" alt="${paragraph.value.Image.value.Title}" title="${paragraph.value.Image.value.Title}" /></figure>
										</div></div>		
								</div>
							</c:if>
						<c:if test="${elementos_total == 12}">
						</div>
						</c:if>
					</div>
				</div>
			</c:forEach> 
		</div>
	</div>
</c:if>
<c:if test="${cms.element.settings.destacado}">
<div class="container-full destacado_seccion" style="background-color: ${cms.element.settings.colorfondo}; margin-bottom: 20px;">
	<div class="container">
		<div class="col-md-12" style="padding-bottom: 50px; border-bottom: 1px dotted #cbe7e9;">
			<h1>${value.Title}</h1>
			<c:forEach var="paragraph" items="${content.valueList.Paragraph}" begin="0" end="0">
				<p>${value.Paragraph.value.Text}</p>
			</c:forEach>
		</div>
	</div>
</div>
</c:if>
</cms:formatter>
</cms:bundle>

