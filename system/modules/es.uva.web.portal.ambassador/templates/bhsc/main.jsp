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

	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js" integrity="sha384-u/bQvRA/1bobcXlcEYpsEdFVK/vJs3+T+nXLsBYJthmdBuavHvAW6UsmqO2Gd/F9" crossorigin="anonymous"></script>
	<!-- Font awesome -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js" integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+" crossorigin="anonymous"></script>
	<!-- CSS -->

	<!--<script src="<cms:link>/system/modules/es.uva.web.portal.ambassador/resources/bhsc/js/bhsc.js</cms:link>"></script>-->

	<link rel="stylesheet" type="text/css" href="/system/modules/es.uva.web.portal.ambassador/resources/bhsc/css/animate.css">
	<link rel="stylesheet" href="<cms:link>/system/modules/es.uva.web.portal.ambassador/resources/bhsc/css/bibliotecaHistorica.css</cms:link>">

	<script src="<cms:link>/system/modules/es.uva.web.portal.ambassador/resources/bhsc/js/bibliotecaHistorica.js</cms:link>"></script>

	<script type="text/javascript">
		jQuery(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<c:if test="${cms.isEditMode}">
	<!--=== Placeholder for OpenCms toolbar in edit mode ===-->
	<div id="editando" style="background: lightgray; height: 50px">&nbsp;</div>
	</c:if>
	<!-- header -->
	<header>
		<div class="container cabecera fondo_blanco border_bottom_azul_oscuro_1" style="box-shadow: 0px 1px 3px #c3c3c3;">
			<div class="row">
				<div class="col-2">
					<img src="<cms:link>/system/modules/es.uva.web.portal.ambassador/resources/bhsc/img/secundariaAzul.jpg</cms:link>" alt="Universidad de Valladolid" style="filter: grayscale(100%);" width="150"/>
				</div>
				<div class="col-10 text-right" style="height: 200px; background: url('<cms:link>/system/modules/es.uva.web.portal.ambassador/resources/bhsc//img/logo_biblioteca.png</cms:link>') no-repeat; background-size: contain">
					<a href="#" style="color: black;"><i class="fas fa-bars fa-3x"></i></a>
				</div>
			</div>
			<div class="row">
				<div class="col-12 text-right" style="border-bottom: 1px solid black;">
					<img src="<cms:link>/system/modules/es.uva.web.portal.ambassador/resources/bhsc/img/universidaddevalladolid.png</cms:link>" style="filter: grayscale(100%);" alt="Universidad de Valladolid" />
				</div>
			</div>
		</div>
	</header>
	
	<!-- breadcrumb -->
	<div class="container fondo_blanco">
		<div class="row">
			<div class="col-12">
				<cms:include file="%(link.weak:/system/modules/es.uva.web.portal.ambassador/elements/menu/nav_breadcrumb.jsp:a908897d-a2a2-11e7-ab7c-0050568213af)" />
			</div>
		</div>
	</div>
	
	<!-- menu -->
	<div class="container menu_horizontal fondo_blanco" style="margin-top: 1em;">
		<cms:include file="%(link.weak:/system/modules/es.uva.web.portal.ambassador/elements/menu/horizontal_menu.jsp:c4dcd6cb-5cea-11e8-bafc-0050568213af)" />
	</div>
	
	<article>
		<!-- Contenedor principal de la página -->
		<cms:container name="contenedor" type="contenedor" width="2000" maxElements="500" />
		<!--<cms:container name="container-boxes" type="content" width="1000" maxElements="50" />-->
	</article>
	
	<!-- buscador -->
	<%--<cms:include file="%(link.weak:/system/modules/es.uva.web.portal.ambassador/elements/buscador/buscador.jsp:eb45919c-a8ed-11e7-9b4d-0050568213af)" />--%>
	<div class="container fondo_blanco buscador" style="margin-top: 1em;">
		<form action="<cms:link>/buscador.html</cms:link>" class="form-inline" method="post">
			<div class="form-row justify-content-md-center" style="width: 100%;">
				<div class="col">
					<input type="search" class="form-control" name="q" id="q" placeholder="Buscar en las colecciones de la biblioteca...">
				</div>
				<div class="col-3 text-left">
					<button type="submit" class="btn btn-primary mb-2">BUSQUEDA COLECCIONES</button>
				</div>
			</div>
		</form>
	</div>
	
	<footer>
	<!-- footer -->
		<div class="container footer fondo_blanco" style="margin-top: 10px">
			<div class="row">
				<div class="col-md-6">
					<img src="<cms:link>/system/modules/es.uva.web.portal.ambassador/resources/bhsc/img/secundariaNegro.jpg</cms:link>" alt="Universidad de Valladolid" style="margin-top: 1em;"/>
					<h3>Biblioteca Historica</h3>
					<p>
						<small>Palacio de Santa Cruz &#8212; Plaza de Santa Cruz, 8. 47012 Valladolid (España)</small><br/>
						<i class="far fa-envelope"></i> <a href="mailto:biblioteca.historica@uva.es">biblioteca.historica@uva.es</a>
					</p>
				</div>
				<div class="col-md-6" style="margin-bottom: -5px; margin-right: -20px; filter: grayscale(100%);">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2981.1930460259437!2d-4.722302584470158!3d41.65157088753852!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd4712b1b3f53785%3A0xe9ec32442c2575f5!2sPalacio+de+Santa+Cruz!5e0!3m2!1ses!2ses!4v1523444634932" width="102.9%" height="250" frameborder="0" style="border:0" allowfullscreen></iframe>
				</div>
			</div>
		</div>
		<div class="container fondo_blanco">
			<div class="row fondo_amarillo">
				<div class="col-md-12">
					<p>Los contenidos suministrados por la web están sujetos a los derechos de propiedad intelectual e industrial y son titularidad exclusiva de Universidad de Valladolid. La adquisición de algún producto o servicio no confiere al adquiriente ningún derecho de alteración, explotación, reproducción o distribución del mismo fuera de lo estrictamente contratado reservándose Universidad de Valladolid todos los derechos.</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>