$(document).ready(function(){
	var item;
	var query = getUrlVars()["q"];
	$('input[name="q"]').val(decodeURIComponent(query));
	if (query=='') {
		query = ' ';
	}
	$.ajax({
		type: 'GET',
		url: 'http://albergueweb1.uva.es/bibliotecas_ws/www/index.php/bhsc/search/text/' + encodeURIComponent(query),
		dataType: 'json'
	}).done(function(data){
		var item;
		if (data.entry.length>0) {
			item = '<dl>';
			data.entry.forEach(function(cosas){
				item +="<dt><h3><a href='"+cosas.link+"' role='link' target='_blank'>"+cosas.title+"</a></h3></dt><dd style='margin-bottom: 20px;'>Autor: "+cosas.author+"</dd>"
			});
			item += '</dl>';
			$('.query_resultados').html(item);
		} else if (data.entry.length==0){
			item = '<h2>No se han encontrado resultados</h2><p>Lo sentimos, no se han encontrado resultados.</p><p>Pruebe a poner otra busqueda diferente o a hacer su busqueda más amplia.</p>';
			$('.query_resultados').html(item);
		} else {
			item = '<h2>Ha ocurrido un error desconocido</h2><p>Lo sentimos, ha ocurrido un error desconocido.<p>Por favor, pruebe más tarde.</p>';
		}
	}).fail(function(data) {
		item = '<h2>Ha ocurrido un error</h2><p>Lo sentimos, no se han encontrado resultados debido a que ha ocurrido un error.</p><p>Por favor, pruebe más tarde. En caso de que se repita, pongase en contacto con <a href="mailto:soporte-web@uva.es">soporte-web@uva.es</a>.</p>';
		$('.query_resultados').html(item);
	});
});

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}