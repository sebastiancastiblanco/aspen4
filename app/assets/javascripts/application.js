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


function cambioEstadoFavoritoHome(procesoid){

    var divProcesoNoFavorito = "#ProcesoNoFavorito"+procesoid;
    var divProcesoFavorito = "#ProcesoFavorito"+procesoid;

    var favoritoProceso =  $(divProcesoNoFavorito).css('display');
      if(favoritoProceso == "inline" || favoritoProceso == "block" ){
      $.ajax({
            url: "/procesos/favorito/" + procesoid,
            dataType: "JSON",
            timeout: 10000,
            success: function(res){
                $(divProcesoNoFavorito).css('display', 'none');
                $(divProcesoFavorito).css('display', 'block');
            }
         }) 
     }
    else{
      $.ajax({
            url: "/procesos/nofavorito/" + procesoid,
            dataType: "JSON",
            timeout: 10000,
            success: function(res){
               $(divProcesoNoFavorito).css('display', 'block');
                $(divProcesoFavorito).css('display', 'none');
            }
         }) 
     }
   
};



