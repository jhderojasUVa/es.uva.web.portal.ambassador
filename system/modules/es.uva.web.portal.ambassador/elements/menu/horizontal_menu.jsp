<%@page taglibs="c,cms,fn" %> 
<div class="col-md-12 menu_horizontal" >
	<c:set var="navStartLevel">0</c:set>
	<c:set var="navStartFolder" value="/" />
	<cms:navigation type="forFolder" resource="${navStartFolder}" startLevel="${navStartLevel}" endLevel="2" var="nav"/>
	<ul class="nav justify-content-center">		
		<c:forEach items="${nav.items}" var="elem" varStatus="loop">
			<c:if test="${elem.navTreeLevel - navStartLevel == 0}">
			<li class="nav-item level-${elem.navTreeLevel - navStartLevel} <c:choose><c:when test="${fn:startsWith(cms.requestContext.uri, elem.resourceName)}"> active"</c:when><c:otherwise>"</c:otherwise></c:choose> >
				<a href="javascript:showhide('nivel-${loop.index}')">${elem.navText}</a>
				<c:if test="${fn:startsWith(cms.requestContext.uri, elem.resourceName)}">
				<script>
					$(document).ready(function(){
						$(".submenu.nivel-${loop.index}").show();
					});
				</script>
				</c:if>
			</li>
			</c:if>
		</c:forEach>
	</ul>
	<c:forEach items="${nav.items}" var="elem" varStatus="loop">
		<cms:navigation type="forSite" resource="${elem.resourceName}" startLevel="0" endLevel="2" var="nav2"/>
		<div class="submenu nivel-${loop.index}">
			<c:if test="${!elem2.first && !elem2.last}">
				<c:forEach items="${nav2.items}" var="elem2">
					<p><a href="${elem2.resourceName}">- ${elem2.navText}</a></p>
				</c:forEach>
			</c:if>
		</div>
	</c:forEach>
</div>