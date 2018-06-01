$(document).ready(function(){
	// Texto de cabecera
	$(".header").css("height",maxheight_window()-250);
	// Flecha
	//$(".bottom-align-text").css("bottom", maxheight_element('bottom-align-text')-600);
	$(".bottom-align-text").css("bottom", maxheight_element('bottom-align-text')+30);
	$(window).resize(function() {
		$(".header").css("height",maxheight_window()-250);
		//$(".bottom-align-text").css("bottom", maxheight_element('bottom-align-text')-600);
		$(".bottom-align-text").css("bottom", maxheight_element('bottom-align-text')+30);
	});
});

function maxheight_window() {
	// Function que devuelve el maximo de la pagina
 	return window.outerHeight;
}

function maxheight_element(element) {
	// Devuelve el alto del elemento
	var maxHeight = Math.max.apply(null, $("."+element).map(function(){
		return $(this).height();
	}).get());
	return maxHeight;
}

function make_scroll() {
	// Hace scroll
	window.scrollTo(0, parseInt(maxheight_window()-100));
}