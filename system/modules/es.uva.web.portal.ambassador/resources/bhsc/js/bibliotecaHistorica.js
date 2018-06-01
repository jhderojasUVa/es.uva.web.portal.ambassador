$(document).ready(function(){
	$(".submenu").hide();
});

function showhide(elem) {
	$(".submenu").hide();
	$("."+elem).show();
}