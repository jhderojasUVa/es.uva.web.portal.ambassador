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
	<%--
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
	--%>
	<c:set var="colortheme"><cms:property name="bs.page.color" file="search" default="red" /></c:set>
	<c:set var="pagelayout"><cms:property name="bs.page.layout" file="search" default="9" /></c:set>
	<%--
	<link rel="stylesheet" href="<cms:link>/system/modules/com.alkacon.bootstrap.formatters/resources/css/themes/${colortheme}.css</cms:link>">
	<link rel="stylesheet" href="<cms:link>/system/modules/com.alkacon.bootstrap.formatters/resources/css/themes/headers/header1-${colortheme}.css</cms:link>">
	<link rel="stylesheet" href="<cms:link>%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/css/page.css)</cms:link>">
	--%>
	
	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

	<%--
	<!-- JQUERY -->
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
	--%>
	<!-- JS -->
	<%--
	<cms:headincludes type="javascript" defaults="%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/hover-dropdown.min.js)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/bxslider/jquery.bxslider.js)
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/back-to-top.js)"
		|%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/js/app.js)" />
	--%>
	
	<!-- Font awesome -->
	<link rel="stylesheet" href="<cms:link>/system/modules/es.uva.web.portal.ambassador/resources/bhsc/fonts/fontawesome/css/font-awesome.min.css</cms:link>">
	
	<script src="<cms:link>/system/modules/es.uva.web.portal.ambassador/resources/bhsc/js/bhsc.js</cms:link>"></script>
	
	<link rel="stylesheet" type="text/css" href="/system/modules/es.uva.web.portal.ambassador/resources/bhsc/css/animate.css">
	<link rel="stylesheet" type="text/css" href="/system/modules/es.uva.web.portal.ambassador/resources/bhsc/css/bhsc.css">
	
	<style>
	.icono-flecha {
		text-shadow: 0 0 2px #000;
		color: white;
		font-size: 7em;
		animation-duration: 2.3s;
		animation-delay: 5s;
		animation-iteration-count: infinite;
    }
	.icono-flecha a:hover {
		text-decoration: none;
	}
	.no_decoration:hover, .no_decoration {
		text-decoration: none;
	}
	</style>

	<script type="text/javascript">
		jQuery(document).ready(function() {
			//App.init();
		});
	</script>
	<!--[if lt IE 9]>
    	<script src="<cms:link>%(link.weak:/system/modules/com.alkacon.bootstrap.formatters/resources/plugins/respond.js)</cms:link>"></script>
	<![endif]-->
</head>
<body>
	<c:if test="${cms.isEditMode}">
	<!--=== Placeholder for OpenCms toolbar in edit mode ===-->
	<div id="editando" style="background: lightgray; height: 50px">&nbsp;</div>
	</c:if>
	<header>
	<div class="container-full header" style="background: url('/_imagenes/biblioteca_historica.jpg') no-repeat center center fixed; background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12" style="color: white; text-shadow: 0 0 5px #000;">
					<strong>Biblioteca Historica Santa Cruz</strong>&nbsp;
					<small>Universidad de Valladolid</small>
					<div class="clear"></div>
					<ul class="breadcrumb">
						<li>BSCH://</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center bottom-align-text">
					<a href="javascript:make_scroll()" class="no_decoration"><span class="glyphicon glyphicon-arrow-down animated infinite tada icono-flecha" aria-hidden="true"></span></a>
				</div>
			</div>
		</div>
	</div>
	</header>
	<article>
		<!-- Contenedor principal de la página -->
		<cms:container name="container-boxes" type="content" width="1000" maxElements="50" />
	</article>
	<footer>
	<!-- footer -->
	<div class="container-fluid footer fondo_marron" style="padding-top:10px; padding-bottom: 10px;">
		<div class="container"> 
			<div class="row" style="padding-top: 10px;">
				<!-- 1 linea -->
				<div class="col-md-2 col-xs-12">
					<h2>Estudios</h2>
					<p><a href="http://www.uva.es/2.docencia/2.01.grados/2.01.02.ofertaformativagrados/2.01.02.01.alfabetica/index.html" role="link">Estudios de Grados de la UVa</a></p>
					<p><a href="http://www.uva.es/2.docencia/2.02.mastersoficiales/2.02.01.ofertaeducativa/2.02.01.01.alfabetica/index.html" role="link">Estudios de Master</p>
					<p><a href="http://www.uva.es/2.docencia/2.03.titulospropios/2.03.01.ofertaformativamasterespropios/">Titulos Propios</a></p>
					<p><a href="http://www.uva.es/2.docencia/2.04.doctorado/2.04.01.ofertaprogramasdoctorado/index.html" role="link">Estudios de Doctorado</a></p>
				</div>
				<div class="col-md-2 col-xs-12">
					<h2>Te interesa</h2>
					<p><a href="http://spanishinvalladolid.com/" role="link">Español en Valladolid</a></p>
					<p><a href="http://www.uva.es/2.docencia/2.05.cursos/2.05.01.cursos/" role="link">Cursos de Formaci&oacute;n</a></p>
				</div>
				<div class="col-md-2 col-xs-12">
					<h2>Descubre</h2>
					<p><a href="http://biblioteca.uva.es/export/sites/biblioteca/" role="link">Bibliotecas Universitarias</a></p>
					<p><a href="http://iee.blogs.uva.es/" role="link">IEE</a></p>
					<p><a href="http://www.parquecientificouva.es/" role="link">Parque Cient&iacute;ficos</a></p>
					<p><a href="http://funge.uva.es/idiomas/" role="link">Centro de Idiomas</a></p>
					<p><a href="http://www.uva.es/6.vidauniversitaria/6.01.cultura/6.01.05.museos/index.html" role="link">Museo</a></p>
				</div>
				<div class="col-md-2 col-xs-12">
					<h2>Participa</h2>
					<p><a href="http://deportes.uva.es" role="link">Deportes</a></p>
					<p><a href="http://buendia.uva.es" role="link">Centro Buendia</a></p>
					<p><a href="http://www.uva.es/6.vidauniversitaria/6.04.gabinetemedico/index.html" role="link">Gabinete M&eacute;dico</a></p>
					<p><a href="http://www.uva.es/6.vidauniversitaria/6.16.asociaciones/" role="link">Asociaciones</a></p>
				</div>
				<div class="col-md-4 col-xs-12">
					<h1 class="lema" style="letter-spacing: -1px; color: #00bdd4; text-shadow: 1px 1px 3px #2b2b2b; display: inline-block; vertical-align: middle;">800 a&ntilde;os de innovaci&oacute;n</h1>
					<h1 class="sublema" style="text-shadow: 1px 1px 3px #2b2b2b; color: #ef2862; margin: 0;">Sapientia Aedificavit Sibi Domvum</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- aviso legal -->
	<div class="container-fluid fondo_gris aviso_legal" style="padding-top:10px; padding-bottom: 10px;">
		<div class="container">
			<div class="col-md-12">
				<h2 class="text-center">UNIVERSIDAD de VALLADOLID // Palacio de Santa Cruz, 47002 Valladolid (España)</h2>
				<p class="text-center">Los contenidos suministrados por la web están sujetos a los derechos de propiedad intelectual e industrial y son titularidad exclusiva de Universidad de Valladolid. La adquisición de algún producto o servicio no confiere al adquiriente ningún derecho de alteración, explotación, reproducción o distribución del mismo fuera de lo estrictamente contratado reservándose Universidad de Valladolid todos los derechos.</p>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>