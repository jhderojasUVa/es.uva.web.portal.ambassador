<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>

<fmt:setLocale value="${cms.locale}" />
<cms:formatter var="content" val="value" >
<c:set var="elementid" value="${cms.element.instanceId}" />
<div class="container">
	<div class="row">

		<div class="col-md-12">
			<!-- 1 -->
			<link title="timeline-styles" rel="stylesheet" href="https://cdn.knightlab.com/libs/timeline3/latest/css/timeline.css">
			<!-- 2 -->
			<script src="https://cdn.knightlab.com/libs/timeline3/latest/js/timeline.js"></script>
			
			<c:set var="elementos" value="${content.valueList.Elementos}" />
			<c:if test="${value.Title.isSet}">
				<h1>${value.Title}</h1>
			</c:if>
			
			<!-- Timeline JSON -->
			<c:set var="timeline_json">
				<json:object >
					<json:property name="scale" value="human"/>
					<json:object name="title">
						<json:object name="media">
							<json:property name="caption" value="CAPTION"/>
							<json:property name="credit" value="CREDIT"/>
							<json:property name="url" value="http://www.uva.es"/>
							<json:property name="thumb" value=""/>
						</json:object>
						<json:object name="text">
							<json:property name="headline" value="${value.Title}"/>
							<json:property name="text" value="${value.Title}"/>
						</json:object>
					</json:object>
					<json:array name="events" var="item" items="${elementos}">
				  		<json:object>
							<c:set var="fecha_formateada" value="${cms:convertDate(item.value.Fecha)}"/>
							<c:set var="year">
								<fmt:formatDate value="${fecha_formateada}" pattern="YYYY"/> 
							</c:set>
							<c:set var="month">
								<fmt:formatDate value="${fecha_formateada}" pattern="MM"/> 
							</c:set>
							<c:set var="day">
								<fmt:formatDate value="${fecha_formateada}" pattern="dd"/> 
							</c:set>
								

							<json:object name="start_date">
								<json:property name="year" value="${year}"/>
								<json:property name="month" value="${month}"/>
								<json:property name="day" value="${day}"/>
								<json:property name="hour" value=""/>
								<json:property name="minute" value=""/>
								<json:property name="second" value=""/>
								<json:property name="millisecond" value=""/>
								<json:property name="format" value=""/>
							</json:object>

							<json:object name="end_date">
								<json:property name="year" value=""/>
								<json:property name="month" value=""/>
								<json:property name="day" value=""/>
								<json:property name="hour" value=""/>
								<json:property name="minute" value=""/>
								<json:property name="second" value=""/>
								<json:property name="millisecond" value=""/>
								<json:property name="format" value=""/>
							</json:object>
						  	<json:property name="group" value="GRUPO 1"/>
							<c:if test="${item.value.Paragraph.value.Image.index>=0}">
								<json:object name="media">
									<json:property name="caption" value="${item.value.Paragraph.value.Image.value.Text}"/>
									<json:property name="credit" value=""/>
									<json:property name="url" value="${item.value.Paragraph.value.Image.value.Image}"/>
									<json:property name="hour" value=""/>
									<json:property name="thumbnail" value=""/>
									<json:property name="alt" value="${item.value.Paragraph.value.Image.value.Text}"/>
									<json:property name="title" value="${item.value.Paragraph.value.Image.value.Text}"/>
								</json:object>
							</c:if>
							<json:object name="text">
								<json:property name="headline" value="${item.value.Titulo_timeline}"/>
								<json:property name="text" value="${item.value.Titulo_timeline}"/>
							</json:object>
							<json:property name="unique_id" value=""/>
						</json:object>
					</json:array>
				</json:object>
			
			</c:set>
			<!-- Timeline -->
			<div id='timeline-embed-${elementid}' style="width: 100%; height: 600px"></div>
			<script >
				var additionalOptions = {
				  start_at_end: false,
				  default_bg_color: {r:0, g:0, b:0},
				  timenav_height: 250 
				}
				var timeline_json = ${timeline_json};
				window.timeline = new TL.Timeline('timeline-embed-${elementid}', timeline_json, additionalOptions);
			</script>
		</div>
	</div>
	

</div>		


</cms:formatter>



