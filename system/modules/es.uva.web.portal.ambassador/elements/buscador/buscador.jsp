<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
	<div class="container fondo_blanco">
		<!-- Buscador -->
		<div class="row">
			<div class="col-md-12">
				<form action="<cms:link>/buscador.html</cms:link>">
				  <div class="input-group input-group-lg" style="width: 100%; margin: auto;">

					<input type="search" class="form-control input-lg" name="q" placeholder="Buscar en las colecciones..."/>
					<span class="input-group-btn">
						<button type="submit" class="btn btn-lg btn-primary"><i class="fas fa-search"></i></button>
					</span>

				  </div>
				</form>
			</div>
		</div>
		<!-- Resultados -->
		<div class="row">
			<div class="col-md-12">
				<div class="query_resultados"></div>
			</div>
		</div>
		<script src="<cms:link>/system/modules/es.uva.web.portal.ambassador/elements/buscador/buscador.js</cms:link>"></script>
	</div>
