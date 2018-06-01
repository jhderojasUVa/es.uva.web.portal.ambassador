<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content"  val="value" rdfa="rdfa">
	<c:set var="id" value="${cms.element.instanceId}" />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="googlemaps-${id}">
					<%-- get width and height of map from content --%>
					<c:set var="maptype">${content.value.MapType}</c:set>
					<c:set var="mapzoom">${content.value.MapZoom}</c:set>
					<c:set var="mapsize">${content.value.MapSize}</c:set>
					<c:set var="sizesep">${fn:indexOf(mapsize, "x")}</c:set>
					<c:if test="${sizesep != -1}">
						<c:set var="mapw">${fn:trim(fn:substringBefore(mapsize, "x"))}</c:set>
						<c:set var="maph">${fn:trim(fn:substringAfter(mapsize, "x"))}</c:set>
					</c:if>
					<c:if test="${not fn:contains(mapw, '%')}">
						<c:set var="mapw">${mapw}</c:set>
					</c:if>
					<c:if test="${not fn:contains(maph, '%')}">
						<c:set var="maph">${maph}</c:set>
					</c:if>

					<c:if test="${not cms.element.settings.hidetitle}">
						<h2 ${value.Headline.rdfaAttr}>${value.Headline}</h2>
					</c:if>

					<c:if test="${value.Text.isSet}">
						<div class="parrafo_in" ${value.Text.rdfaAttr}>${value.Text}</div>
					</c:if>

					<c:set var="id">${cms.element.instanceId}</c:set>
					<c:set var="lat">41.651567</c:set>
					<c:set var="lng">-4.720114</c:set>
					<c:set var="markers"></c:set>

					<c:if test="${not empty value.MapCoord }">
						<jsp:useBean id="coordBean" class="org.opencms.widgets.CmsLocationPickerWidgetValue" />
						<c:set var="markers">&markers=size:mid|color:red</c:set>
						<c:forEach var="mapcoord" items="${content.valueList.MapCoord}" varStatus="status">
							<c:set var="label">${mapcoord.value.Caption}</c:set>
							<jsp:setProperty name="coordBean" property="wrappedValue" value="${mapcoord.value.Coord.stringValue}" />
							<c:set var="markerLat" value="${coordBean.lat}" />
							<c:set var="markerLng" value="${coordBean.lng}" />
							<c:set var="markers">${markers}|label:${label}|${markerLat},${markerLng}</c:set>
						</c:forEach>

					</c:if>
					<c:if test="${ (cms.element.settings.javascriptenabled == null) || cms.element.settings.javascriptenabled == false}">
						<c:set var="url">https://maps.googleapis.com/maps/api/staticmap?center=${lat},${lng}&maptype=${maptype}&zoom=${mapzoom}&size=${mapw}x${maph}${markers}&key=AIzaSyDQBMjz4qeaDGZ8E8ZBW_p5SWk5a-hNit8</c:set>
						<c:set var="url">https://maps.googleapis.com/maps/api/staticmap?maptype=${maptype}&zoom=${mapzoom}&size=${mapw}x${maph}${markers}&key=AIzaSyDQBMjz4qeaDGZ8E8ZBW_p5SWk5a-hNit8</c:set>
						<img src="${url}" class="img-responsive" />
					</c:if>



					<c:if test="${cms.element.settings.javascriptenabled == 'true' || cms.element.settings.javascriptenabled}">
						<div id="map-${id}" style="width: 100%; height: ${maph}px;"></div>

						<script>
							function initMap() {
								var uluru = { lat:${markerLat}, lng:${markerLng} };
								var map = new google.maps.Map(document.getElementById('map-${id}'), {
									zoom: ${mapzoom},
									center: uluru
								});
								<c:forEach var="mapcoord" items="${content.valueList.MapCoord}" varStatus="status">
									var marker = new google.maps.Marker({
										label: '${label}',
										position: uluru,
										map: map
									});
								</c:forEach>
							}
						</script>
						<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQBMjz4qeaDGZ8E8ZBW_p5SWk5a-hNit8&callback=initMap"></script>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</cms:formatter>