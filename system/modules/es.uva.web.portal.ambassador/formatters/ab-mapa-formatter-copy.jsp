<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content"  val="value" rdfa="rdfa">
	<%-- get width and height of map from content --%>
	<c:set var="mapsize">${content.value.MapSize}</c:set>
	<c:set var="sizesep">${fn:indexOf(mapsize, "x")}</c:set>
	<c:if test="${sizesep != -1}">
		<c:set var="mapw">${fn:trim(fn:substringBefore(mapsize, "x"))}</c:set>
		<c:set var="maph">${fn:trim(fn:substringAfter(mapsize, "x"))}</c:set>
	</c:if>
	<c:if test="${not fn:contains(mapw, '%')}">
		<c:set var="mapw">${mapw}px</c:set>
	</c:if>
	<c:if test="${not fn:contains(maph, '%')}">
		<c:set var="maph">${maph}px</c:set>
	</c:if>

		<!-- columna central -->
	<div id="contenedor_mapa" class="contenedor">
    <style>
	#centerandrightcontainer {
		float: left;
	}
	</style>
	<div class="row">
		<c:if test="${not cms.element.settings.hidetitle}">
			<div class="headline">
				<h2 ${value.Headline.rdfaAttr}>${value.Headline}</h2>
			</div>
		</c:if>

		<c:if test="${value.Text.isSet}">
			<div ${value.Text.rdfaAttr}>${value.Text}</div>
		</c:if>

		<c:set var="id"><apollo:idgen prefix='map' uuid='${cms.element.instanceId}' /></c:set>
		
		
		<c:forEach items="${content.valueList.MapCoord}" var="naventry">
			
			<fmt:parseNumber var="profundidad" type="number"
				value="${naventry.value.Profundidad}" />
			<c:if test="${naventry.value.Caption.exists}">
				<h2${naventry.rdfa.Titulo}>${naventry.value.Caption}</h2>
			</c:if>

			<cms:navigation type="forFolder" resource="${naventry.value.Carpeta}"
				var="nav" />
			<c:forEach items="${nav.items}" var="elem" varStatus="status">
				<div id="mapa_nivel1" class="col-md-4">
					
					<c:choose>
     				<c:when test='${(status.index)%2 eq 0}'>
      					<c:set var="idmio" value="columna" scope="page"/>	
    				</c:when>
    				<c:otherwise>
      				
    				</c:otherwise>
  				</c:choose>
  				


					<c:set var="level1exclude" value="0" />
					<c:forEach items="${content.valueList.Navexcludepoint}"
						var="navexclude">
						<c:if test="${navexclude.value.Carpeta==elem.resourceName}">
							<c:set var="level1exclude" value="1" />
							<c:if test="${navexclude.value.AllSubTree=='true'}">
								<c:set var="level1exclude" value="2" />
							</c:if>
						</c:if>

					</c:forEach>
					<c:choose>
						<c:when test="${level1exclude=='1'}">
							<h2>${elem.navText}</h2>
						</c:when>
						<c:when test="${level1exclude=='2'}">

						</c:when>
						<c:otherwise>
							<h2>								
								<c:set var="elemento" value="${elem.resourceName}index.html"/>
								<c:set var="hayelemento" value="false"/>
								<c:if test="${cms:vfs(pageContext).exists[elemento]}" >
									<c:set var="hayelemento" value="true"/>
									<a href="<cms:link>${elem.resourceName}</cms:link>">${elem.navText}</a>
								</c:if>
								<c:if test="${!hayelemento}" >
									${elem.navText}
								</c:if>
							</h2>
						</c:otherwise>
					</c:choose>
					<!--  profundidad > 1 -->
					<c:if test="${profundidad>1 && level1exclude!='2'}">
						<cms:navigation type="forFolder" resource="${elem.resourceName}"
							var="nav1" />
						<c:forEach items="${nav1.items}" var="elem1">
							<div id="columna">
								<c:set var="level2exclude" value="0" />
								<c:forEach items="${content.valueList.Navexcludepoint}"  var="navexclude">
									<c:if test="${navexclude.value.Carpeta==elem1.resourceName}">
										<c:set var="level2exclude" value="1" />
										<c:if test="${navexclude.value.AllSubTree=='true'}">
											<c:set var="level2exclude" value="2" />
										</c:if>
									</c:if>
								</c:forEach>
								<c:choose>
									<c:when test="${level2exclude=='1'}">
										${elem1.navText}
									</c:when>
									<c:when test="${level2exclude=='2'}">
									</c:when>
									<c:otherwise>
										<h3>
											<c:set var="elemento" value="${elem1.resourceName}index.html"/>
											<c:set var="hayelemento" value="false"/>
									
											<c:if test="${cms:vfs(pageContext).exists[elemento]}" >
												<c:set var="hayelemento" value="true"/>
												<a href="<cms:link>${elem1.resourceName}</cms:link>">${elem1.navText}</a>
											</c:if>
											<c:if test="${!hayelemento}" >
												${elem1.navText}
											</c:if>
										</h3>
									</c:otherwise>
								</c:choose>

								<!--  profundidad > 2 -->
							 	<c:if test="${profundidad>2 && level2exclude!='2'}">
									
										<cms:navigation type="forFolder" resource="${elem1.resourceName}" var="nav2" />
										<c:forEach items="${nav2.items}" var="elem2" varStatus="status">
											<c:if test="${status.first}" >
												<ul>
											</c:if>
											<c:set var="level3exclude" value="0" />

											<c:forEach items="${content.valueList.Navexcludepoint}" var="navexclude">
												<c:if test="${navexclude.value.Carpeta==elem2.resourceName}">
													<c:set var="level3exclude" value="1" />
													<c:if test="${navexclude.value.AllSubTree=='true'}">
														<c:set var="level3exclude" value="2" />
													</c:if>
												</c:if>

											</c:forEach>									
											<c:choose>
												<c:when test="${level3exclude=='1'}">
													<li>${elem2.navText}</li>
												</c:when>
												<c:when test="${level3exclude=='2'}">
												</c:when>
												<c:otherwise>
													<c:set var="elemento" value="${elem2.resourceName}index.html"/>
													<c:set var="hayelemento" value="false"/>
													<c:if test="${cms:vfs(pageContext).exists[elemento]}" >
														<c:set var="hayelemento" value="true"/>
														<li><a href="<cms:link>${elem2.resourceName}</cms:link>">${elem2.navText}</a></li>
													</c:if>
													<c:if test="${!hayelemento}" >
														<li>${elem2.navText}</li>
													</c:if>
												</c:otherwise>
											</c:choose>	
											<c:if test="${status.last}">
												</ul>
											</c:if>
										</c:forEach>
								</c:if>
								
							</div>
						</c:forEach>
					</c:if>
				</div>
				<!--<div id="clear"></div>-->
				
			</c:forEach>
			
		</c:forEach>
		</div>
	</div> 
</cms:formatter>