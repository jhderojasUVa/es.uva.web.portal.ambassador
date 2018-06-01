<%@page buffer="none" session="false" trimDirectiveWhitespaces="true" %><%--
--%><%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %><%--
--%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%--
--%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%--
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
--%><fmt:setLocale value="${cms.locale}" /><!DOCTYPE html>
<html lang="en">
<head>
	<title>${cms.title}</title>
	
	<meta charset="${cms.requestContext.encoding}">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta name="description" content="<cms:property name="Description" file="search" default="" />">
	<meta name="keywords" content="<cms:property name="Keywords" file="search" default="" />">
	<meta name="robots" content="index, follow">
	<meta name="revisit-after" content="7 days">

	<link rel="apple-touch-icon" sizes="120x120" href="<cms:link>/system/modules/com.alkacon.bootstrap.formatters/resources/img/favicon_120.png</cms:link>"/>
	<link rel="shortcut icon" href="<cms:link>/system/modules/com.alkacon.bootstrap.formatters/resources/img/favicon_16.png</cms:link>" type="image/png"/>

	<cms:enable-ade/>
	
	<c:if test="${not cms.isOnlineProject}">
		<cms:headincludes type="css" closetags="false" defaults="%(link.weak:/system/modules/com.alkacon.bootstrap.basics/resources/bootstrap/css/bootstrap.css)" />
	</c:if>
	<c:if test="${cms.isOnlineProject}">
		<cms:headincludes type="css" closetags="false" defaults="%(link.weak:/system/modules/com.alkacon.bootstrap.basics/resources/bootstrap/css/bootstrap.min.css)" />
	</c:if>
	
	<cms:headincludes type="css" closetags="false" defaults="%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/css/style.css)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/css/responsive.css)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/bxslider/jquery.bxslider.css)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/font-awesome/css/font-awesome.css)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/css/headers/header1.css)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/css/search.css)" />
		
	<c:set var="colortheme"><cms:property name="bs.page.color" file="search" default="red" /></c:set>
	<c:set var="pagelayout"><cms:property name="bs.page.layout" file="search" default="9" /></c:set>
	<link rel="stylesheet" href="<cms:link>/system/modules/com.alkacon.bootstrap.formatters/resources/css/themes/${colortheme}.css</cms:link>">
	<link rel="stylesheet" href="<cms:link>/system/modules/com.alkacon.bootstrap.formatters/resources/css/themes/headers/header1-${colortheme}.css</cms:link>">
	<link rel="stylesheet" href="<cms:link>%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/css/page.css)</cms:link>">


	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

	<c:if test="${not cms.isOnlineProject}">
		<cms:headincludes type="javascript" defaults="
			%(link.weak:/system/modules/com.alkacon.bootstrap.basics/resources/jquery/jquery-1.10.2.js)|
		    %(link.weak:/system/modules/com.alkacon.bootstrap.basics/resources/jquery/jquery-migrate-1.2.1.min.js)|
			%(link.weak:/system/modules/com.alkacon.bootstrap.basics/resources/bootstrap/js/bootstrap.min.js)" />
	</c:if>
	<c:if test="${cms.isOnlineProject}">
		<cms:headincludes type="javascript" defaults="
			%(link.weak:/system/modules/com.alkacon.bootstrap.basics/resources/jquery/jquery-1.10.2.min.js)|
		    %(link.weak:/system/modules/com.alkacon.bootstrap.basics/resources/jquery/jquery-migrate-1.2.1.min.js)|
			%(link.weak:/system/modules/com.alkacon.bootstrap.basics/resources/bootstrap/js/bootstrap.min.js)" />
	</c:if>
	<cms:headincludes type="javascript" defaults="%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/hover-dropdown.min.js)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/bxslider/jquery.bxslider.js)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/back-to-top.js)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/js/app.js)" />
		
		
	<cms:headincludes type="css" closetags="false" defaults="%(link.weak:/system/modules/es.uva.web.portal.opencms.v85.template/resources/css/animate.css)
		|%(link.weak:/system/modules/es.uva.web.portal.opencms.v85.template/resources/css/cabecera.css)
		|%(link.weak:/system/modules/es.uva.web.portal.opencms.v85.template/resources/css/noticia_noticia_evento.css)
		|%(link.weak:/system/modules/es.uva.web.portal.opencms.v85.template/resources/css/destacado-1.css)
		|%(link.weak:/system/modules/es.uva.web.portal.opencms.v85.template/resources/css/enlaces.css)" />

	<cms:headincludes type="css" closetags="false" defaults="%(link.weak:/system/modules/es.uva.web.portal.ambassador/resources/bhsc/css/fonts.css:b77a051a-a2a5-11e7-ab7c-0050568213af)
															|%(link.weak:/system/modules/es.uva.web.portal.ambassador/resources/bhsc/css/animate.css:7cbf8e77-a2ad-11e7-ab7c-0050568213af)" />

	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
		});
	</script>
	<!--[if lt IE 9]>
    	<script src="<cms:link>%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/respond.js)</cms:link>"></script>
	<![endif]-->
</head>
<body>
<c:if test="${cms.isEditMode}">
<!--=== Placeholder for OpenCms toolbar in edit mode ===-->
<div id="editando" style="background: lightgray; height: 65px">&nbsp;</div>
</c:if>

<!-- Migas -->
<div class="container" style="margin-bottom: 20px;">
	<div class="row">
		<div class="col-md-12">
			<cms:include file="%(link.weak:/system/modules/es.uva.web.portal.ambassador/elements/menu/nav_breadcrumb.jsp:a908897d-a2a2-11e7-ab7c-0050568213af)" />
		</div>
	</div>
</div>

<!-- Contenedor principal de la página -->
<cms:container name="container-boxes" type="contenedor" width="1000" maxElements="50" />



</body>
</html>