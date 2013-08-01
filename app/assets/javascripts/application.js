// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function CambioEstadofavorito(){
$("#favorito").click(function()
  {
  	var favoritoProceso =  $('#ProcesoNoFavorito').css('display');
  	alert("proceso id "+gon.proceso_id);
  	if(favoritoProceso == "inline" || favoritoProceso == "block" ){
     	$('#ProcesoNoFavorito').css('display', 'none');
     	$('#ProcesoFavorito').css('display', 'block');	
     }
     else{
     	$('#ProcesoFavorito').css('display', 'none');
     	$('#ProcesoNoFavorito').css('display', 'block');		
     }
   });
};

function cambioEstadoFavoritoHome(procesoid){
    var favoritoProceso =  $('#ProcesoNoFavorito').css('display');
  	if(favoritoProceso == "inline" || favoritoProceso == "block" ){
     	$.ajax({
		        url: "/procesos/favorito/" + procesoid,
		        dataType: "JSON",
		        timeout: 10000,
		        success: function(res){
              $('#ProcesoNoFavorito').css('display', 'none');
     			    $('#ProcesoFavorito').css('display', 'block');
		        }
		     })	
     }
    else{
     	$.ajax({
            url: "/procesos/nofavorito/" + procesoid,
            dataType: "JSON",
            timeout: 10000,
            success: function(res){
              $('#ProcesoFavorito').css('display', 'none');
              $('#ProcesoNoFavorito').css('display', 'block');    
            }
         }) 
     }
   
};

function formularioCompartirProceso(){
$('formCompartirProceso').click(function() {  
    alert("form compartir");
    $('#myModal').foundation('reveal', 'close');
});
};


$(document).ready(function(){
   CambioEstadofavorito();
   cambioEstadoFavoritoHome(vari);
   formularioCompartirProceso();
});
