<%@page buffer="none" session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%

/* Semanticamente habria que ve, segun como escriban en un futuro
   como consideramos esto. Así pueden ser secciones (section) del article
   principal, o lo dejamos como un article generico el container gordo
   y vemos si asi, el significado es el correcto
   
   Por depronto, no metemos el section (con los header correspondientes, semanticos)
   que mas vale de poco que de mucho y mal */

%>

<fmt:setLocale value="${cms.locale}" />
<cms:bundle basename="es.uva.web.portal.ambassador.imagen">
<cms:formatter var="content" val="value" rdfa="rdfa">

	<div class="container margin-15-bottom">
		
		<c:if test="${not cms.element.settings.hideTitle}">
			<div class="row">
				<div class="col-md-12">
					<div class="headline"><h2 ${rdfa.Title}>${value.Title}</h2></div>
				</div>
			</div>
		</c:if>
		<c:if test="${cms.element.settings.hidetitle}">
			<div class="row">
				<div class="col-md-12">
					<div class="hide" ><h2 ${rdfa.Title}>${value.Title}</h2></div>
				</div>
			</div>
		</c:if>
		
		
		<div class="row">
			<c:forEach var="item" items="${content.valueList.Item}">
				<div ${item.rdfa["Link|Image"]} class="${cms:lookup(cms:getListSize(content.valueList.Item), '1:col-md-12|2:col-md-6|3:col-md-4|4:col-md-3 col-sm-6|5:col-md-2 col-sm-6|6:col-md-2 col-sm-4')}">
					<c:if test="${item.value.Image.isSet}">
							<figure>
								<img src="<cms:link>${item.value.Image}</cms:link>" class="img-responsive" alt="${item.value.Text}" />
								<c:if test="${item.value.Headline.isSet}">
									<c:if test="${not cms.element.settings.hidefoot}">
										<figcaption class="text-center">
										
										<h5>
											${item.value.Headline}
										</h5>
										</figcaption>
									</c:if>
									<c:if test="${cms.element.settings.hidefoot}">
										<figcaption class="hide">${item.value.Headline}</figcaption>
									</c:if>
								</c:if>
								
							</figure>
					<c:if test="${item.value.Link.isSet}">
						<div class="text-center">
							<a class="btn btn-primary" href="<cms:link>${item.value.Link}</cms:link>" role="link">Leer más <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
						</div>
					</c:if>
					</c:if>
				</div>
				
	<%--
	<div class="caption">
	<c:choose>
	<figcaption>
	<c:when test="${item.value.Headline.isSet && item.value.Link.isSet}">
	<h5><a class="hover-effect" href="<cms:link>${item.value.Link}</cms:link>" ${item.rdfa.Headline}>${item.value.Headline}</a></h5>
	</c:when>
	<c:when test="${item.value.Headline.isSet}">
	<c:if test="${not cms.element.settings.hidefoot}">
	<p class="small" ${item.rdfa.Headline}>${item.value.Headline}</p> 
	</c:if>
	</c:when>
	</figcaption>
	</c:choose>
	<!-- <p ${item.rdfa.Text}>${item.value.Text}</p> -->
	<c:if test="${not item.value.Image.isSet and item.value.Link.isSet}"><div style="text-align: right; margin-top: 20px;"><a class="btn-more hover-effect" style="position: relative;" href="<cms:link>${item.value.Link}</cms:link>" role="link" aria-label="Enlace a ${item.value.Link}"><fmt:message key="imagerow.frontend.readmore" /></a></div></c:if>
	</div>
	</div>
	--%>
			</c:forEach>	
		</div>
	</div>

</cms:formatter>
</cms:bundle>