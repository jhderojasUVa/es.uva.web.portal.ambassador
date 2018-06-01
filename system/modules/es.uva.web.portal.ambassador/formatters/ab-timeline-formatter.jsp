<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value="${cms.locale}" />
<cms:formatter var="content" val="value" >
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="timeline">
					<c:if test="${value.Titulo.isSet}">
						<h1>${value.Titulo}</h1>
					</c:if>
					<c:set var="elementos" value="${content.valueList.Elementos}" />
					<!-- Timeline -->
					<section class="cd-horizontal-timeline">
						<div class="timeline">
							<div class="events-wrapper">
								<div class="events">
									<ol>
										<c:forEach var="elemento" items="${elementos}" varStatus="status">
											<c:set var="fecha_formateada" value="${cms:convertDate(elemento.value.Fecha)}"/>
											<li><a href="#0" data-date="<fmt:formatDate value="${fecha_formateada}" timeStyle="short" pattern="dd/MM/YYYY"/>"<c:if test="${elemento.index == 0}"> class="selected"</c:if>>${elemento.value.Titulo_timeline}</a></li>
								</c:forEach>
							</ol>

						<span class="filling-line" aria-hidden="true"></span>
						</div> <!-- .events -->
				</div> <!-- .events-wrapper -->

				<ul class="cd-timeline-navigation">
					<li><a href="#0" class="prev inactive">Prev</a></li>
					<li><a href="#0" class="next">Next</a></li>
				</ul> <!-- .cd-timeline-navigation -->
			</div> <!-- .timeline -->

			<div class="events-content">
				<ol>
					<c:forEach var="elemento" items="${elementos}" varStatus="status">
						<c:set var="fecha_formateada" value="${cms:convertDate(elemento.value.Fecha)}"/>
						<li data-date="<fmt:formatDate value="${fecha_formateada}" timeStyle="short" pattern="dd/MM/YYYY"/>"<c:if test="${elemento.index == 0}"> class="selected"</c:if>>
					<c:if test="${elemento.value.Titulo_timeline.isSet}">
						<h2>${elemento.value.Titulo_timeline}</h2>
					</c:if>
					<em><fmt:formatDate value="${fecha_formateada}" timeStyle="short" pattern="dd/MM/YYYY"/></em>
					<p>	
						${elemento.value.Paragraph.value.Text}
					</p>
					</li>
				</c:forEach>

			</ol>
	</div> <!-- .events-content -->
	</section>

<script src="/system/modules/es.uva.web.portal.ambassador/resources/bhsc/js/timeline.js"></script>

</div>
</div>
</div>
</div>
</cms:formatter>


