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
//= require jquery-ui 
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require foundation
//= require autocomplete-rails
//= require_tree .

$(function(){$(document).foundation();});

function cambioEstadoProceso (procesoid){
    $.ajax({
            url: "/procesos/estadoProceso/"+procesoid+"/"+$('#listaEstadoProceso').val(),
            dataType: "JSON",
            timeout: 10000,
            success: function(res){

            }
         })
};


function reporteProceso (procesoid){
   
    var divPanelProceso = "#panelReporteProceso";
    var divpanelReporteProcesoImagen = "#panelReporteProcesoImagen";
    
    var divprocesosSelectVal = $('#procesosSelect').val();
   
    
    if (divprocesosSelectVal) {

       $.ajax({
            url: "/reportes/reporteProceso/"+divprocesosSelectVal,
            type: 'GET',       
            success: function(res){
              
            }
         })

      $(panelReporteProcesoGeneral).css('display', 'block');
      $(panelReporteProcesoImagen).css('display', 'none');
      
    }else{
      $(panelReporteProcesoGeneral).css('display', 'none');
      $(panelReporteProcesoImagen).css('display', 'block');
    }

    
};

function aceptarInvitado(invitacionid){
  $.ajax({
            url: "/invitacions/confirmarInvitacion/" + invitacionid,
            dataType: "JSON",
            timeout: 10000,
            success: function(res){
                alert("Tienes un nuevo mienbro en tu grupo de colegas." + res);
                
                $('#comments ul.comments').html("<%= escape_javascript render(@invitacions");
            }
         })
}

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

function cambioEstadoFavoritoHome2(procesoid){

    var divProcesoNoFavorito = "#Proceso2NoFavorito"+procesoid;
    var divProcesoFavorito = "#Proceso2Favorito"+procesoid;

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

function listarParticipantes(){
  $('#formParticipante').remove();
  $("#participantes").toggle( "fade" );
  $("#noticeMsgEliminar").hide();
  $("#new_participante_link").show();
  $('#listar_participante_link').hide();
  document.getElementById("tituloParticipante").innerHTML = "Participantes";
}

function listarContratos(){
  $('#formContrato').remove();
  $('#contratos').toggle( "fade" );
  $("#noticeMsgEliminar").hide();
  $('#new_contrato_link').show();
  $('#listar_contratos_link').hide();
  document.getElementById("tituloContrato").innerHTML = "Contratos";
}

function listarActividades(){
  $('#formActividad').remove();
  $('#actividades').toggle( "fade" );
  $("#noticeMsgEliminar").hide();
  $('#new_actividad_link').removeClass('ocultar');
  $('#new_actividad_link').show();
  $('#listar_actividades_link').hide();
  $('#listaFiltros').show();

  document.getElementById("tituloActividad").innerHTML = "Actividades";
}

function listarUsuarios(){
  $('#formUsuario').remove();
  $('#usuarios').show();
  $('#new_usuario_link').show();
  $('#listar_usuarios_link').hide();
  document.getElementById("tituloUsuario").innerHTML = "Usuarios";
}


function eventoCamposOpcionalesParticipante (){
    var panelcamposopcionales = "#camposOpcionalesParticipante";
    var display =  $(panelcamposopcionales).css('display');
      if(display == "block" ){
         //$(panelcamposopcionales).css('display', 'none');
         $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Mostrar Campos Opcionales";
         document.getElementById("displayOpcionales").value = false;
      }
      else{
         //$(panelcamposopcionales).css('display', 'block');
         $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Ocultar Campos Opcionales";
         document.getElementById("displayOpcionales").value = true;
      }
}


function eventoCamposOpcionalesContrato (){
    var panelcamposopcionales = "#camposOpcionalesContrato";
    var display =  $(panelcamposopcionales).css('display');
      if(display == "block" ){
        $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Mostrar Campos Opcionales";
         document.getElementById("displayOpcionales").value = false;
      }
      else{
        $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Ocultar Campos Opcionales";
         document.getElementById("displayOpcionales").value = true;
      }
}

function eventoCamposOpcionalesActividad (){
    var panelcamposopcionales = "#camposOpcionalesActividad";
    var display =  $(panelcamposopcionales).css('display');
      if(display == "block" ){
        $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Mostrar Campos Opcionales";
          document.getElementById("displayOpcionales").value = false;
      }
      else{
         $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Ocultar Campos Opcionales";
          document.getElementById("displayOpcionales").value = true;
      }
}

function eventoCamposOpcionalesActividadProximos (){
    var panelcamposopcionales = "#camposOpcionalesActividadProximos";
    var display =  $(panelcamposopcionales).css('display');
      if(display == "block" ){
        $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Mostrar Proximas Actividades";
          
      }
      else{
         $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Ocultar Proximas Actividades";
          
      }
}

function eventoCamposOpcionalesAlertasProximos (){
    var panelcamposopcionales = "#camposOpcionalesAlertasProximos";
    var display =  $(panelcamposopcionales).css('display');
      if(display == "block" ){
        $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Mostrar Proximas Alertas";
          
      }
      else{
         $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Ocultar Proximas Alertas";
          
      }
}

function eventoCamposOpcionalesUsuario (){
    var panelcamposopcionales = "#camposOpcionalesUsuario";
    var display =  $(panelcamposopcionales).css('display');
      if(display == "block" ){
         $(panelcamposopcionales).css('display', 'none');
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Mostrar Campos Opcionales";
      }
      else{
         $(panelcamposopcionales).css('display', 'block');
         document.getElementById("mostrarCamposOpcionales").innerHTML = "Ocultar Campos Opcionales";
      }
}


function nuevoParticipante(){
    $('#participantes').hide();
    $('#listar_participante_link').show();
    $('#new_participante_link').hide();
    $("#noticeMsgEliminar").hide();
    $('#formularioParticipantes').html("<%= escape_javascript(render(:partial => 'form')) %>");
    document.getElementById("tituloParticipante").innerHTML = "Nuevo Participante";
}


function moveEvent(the_event,dayDelta,minuteDelta,allDay) {
  $.ajax({  
    type: 'GET',                                    
    url: '/eventos/move/'+the_event.id,  //the script to call to get data          
    data: {id: the_event.id,minute_delta: minuteDelta, day_delta: dayDelta, all_day: allDay } ,                      //you can insert url argumnets here to pass to api.php
    success: function()          //on receive of reply
    {
        
    } 
  });
}

function resizeEvent(the_event,dayDelta,minuteDelta,allDay) {
  $.ajax({  
    type: 'GET',                                    
    url: '/eventos/resize/'+the_event.id,  //the events resize function.         
    data: {id: the_event.id,minute_delta: minuteDelta, day_delta: dayDelta, all_day: allDay },                      //you can insert url argumnets here to pass to api.php
    success: function()          //on receive of reply
    {
     
    } 
  }); 
}

function editEvent(the_event, jsEvent, view) {
  $.ajax({  
    type: 'GET',                                    
    url: '/eventos/'+the_event.id+'/edit',  //the script to call to get data          
    success: function()          //on receive of reply
    {
      $('#evento_start').val($.fullCalendar.formatDate( the_event.start , 'dd MMMM yyyy, hh:mm tt'));
      if (the_event.end != null){
       $('#evento_end').val($.fullCalendar.formatDate( the_event.end , 'dd MMMM yyyy, hh:mm tt'));
      }
      else{
       $('#evento_end').val($.fullCalendar.formatDate( the_event.start , 'dd MMMM yyyy, hh:mm tt')); 
      } 
    } 
  });
}
function newEvent(date) {
  $.ajax({  
    type: 'GET',                                    
    url: '/eventos/new',  //the script to call to get data          
    data: {date: date} ,
    success: function()          //on receive of reply
    {
      $('#evento_start').val($.fullCalendar.formatDate( date , 'dd MMMM yyyy, hh:mm tt'));
      $('#evento_end').val($.fullCalendar.formatDate( date , 'dd MMMM yyyy, hh:mm tt'));
    } 
  });
}

function eventoTareasEjecutadas (){
    var panelcamposopcionales = "#camposTareasEjecutadas";
    var display =  $(panelcamposopcionales).css('display');
      if(display == "block" ){
        $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarTareasEjecutadas").innerHTML = "Historial de la Actividad";
          document.getElementById("displayOpcionales").value = false;
      }
      else{
         $(panelcamposopcionales).toggle( "fade" );
         document.getElementById("mostrarTareasEjecutadas").innerHTML = "Ocultar Historial de la Actividad";
          document.getElementById("displayOpcionales").value = true;
      }
}


 


$(document).ready(function(){
  $('#noticeMsg').hide();
  $(document).foundation('joyride', 'start');

    $('#calendar').fullCalendar({
          events: '/eventos',
          editable:true,
          ignoreTimezone: true,
          eventClick: function(calEvent, jsEvent, view) {
              editEvent(calEvent, jsEvent, view);

          },
          eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
              moveEvent(event,dayDelta,minuteDelta,allDay);
          },
          eventResize: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
              resizeEvent(event,dayDelta,minuteDelta,allDay);
          },

          header: {
              left:   'today prev,next',
              center: 'title',
              right:  'agendaDay agendaWeek ,month'
          },
          monthNames:['Enero' , 'Febrero' , 'Marzo' , 'Abril' , 'Mayo' , 'Junio' , 'Julio' ,
                        'Agosto' , 'Septiembre' , 'Octubre' , 'Noviembre' , 'Diciembre' ],
          dayNames: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
          monthNamesShort: ['Enero' , 'Febrero' , 'Marzo' , 'Abril' , 'Mayo' , 'Junio' , 'Julio' ,
                        'Agosto' , 'Septiembre' , 'Octubre' , 'Noviembre' , 'Diciembre' ],
          dayNamesShort: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
           buttonText: {
                        prev: '&nbsp;&#9668;&nbsp;',
                        next: '&nbsp;&#9658;&nbsp;',
                        prevYear: '&nbsp;&lt;&lt;&nbsp;',
                        nextYear: '&nbsp;&gt;&gt;&nbsp;',
                        today : 'Hoy',
                        month:  'Mes',
                        week:   'Semana',
                        day:    'Dia'
                      },
          firstDay : 1,
         dayClick: function(date) {
              newEvent(date); 
          }
    })
 
});



function eliminarRegistroActividad() {
 alert("delete");
}

function cerrarPanelBuscarProceso(){
    var divPanelProceso = "#panelBuscarProceso";
    $(divPanelProceso).toggle( "fade" );
}

function mostrarPanelBuscarProceso(){
    var divPanelProceso = "#panelBuscarProceso";
    $(divPanelProceso).toggle( "fade" );
    
};


function cerrarPanelBuscarCliente(){
    var divPanelProceso = "#panelBuscarCliente";
    $(divPanelProceso).toggle( "fade" );
}

function mostrarPanelBuscarCliente(){
    var divPanelProceso = "#panelBuscarCliente";
    $(divPanelProceso).toggle( "fade" );
    
};

function mostarcontacto(contactoid){
   var panel = "#panelcontacto_"+contactoid;
   var link1 = "#contactar_"+contactoid;
   var link2 = "#contactarCancelar_"+contactoid;
    $(panel).toggle( "fade" );
    $(link1).addClass("ocultar");
    $(link2).removeClass("ocultar");
    
};

function ocultarcontacto(contactoid){
   var panel = "#panelcontacto_"+contactoid;
   var link1 = "#contactar_"+contactoid;
   var link2 = "#contactarCancelar_"+contactoid;
    $(panel).toggle( "fade" );
    $(link1).removeClass("ocultar");
    $(link2).addClass("ocultar");
    
};

$(document).foundation();



function modopanel(){
    var link1 = "#listaProcesos";
    var link2 = "#datagridprocesos_wrapper";
    var link11 = "#modopanel1";
    var link12 = "#mododatagrid1";

    $(link1).show();
    $(link2).hide();
    $(link12).removeClass("fondoBlanco");
    $(link11).addClass("fondoBlanco");

};


function mododatagrid(){
   var link1 = "#listaProcesos";
   var link2 = "#datagridprocesos_wrapper";
   var link11 = "#modopanel1";
    var link12 = "#mododatagrid1";

    $(link2).show();
    $(link1).hide();
    $(link11).removeClass("fondoBlanco");
    $(link12).addClass("fondoBlanco");
};


$(function() {
  $('#loading')
    .hide()  // hide it initially.
    .ajaxStart(function() {
      $(this).show(); // show on any Ajax event.
    })
    .ajaxStop(function() {
      $(this).hide(); // hide it when it is done.
  });
});


function cambioEstadoDocumento(documentoid){

    var documentocheck = "#documentocheck"+documentoid;
    var img1doc = "#img1doc"+documentoid;
    var img2doc = "#img2doc"+documentoid;

    var valdocumentocheck =  $(documentocheck).val();
      if($(documentocheck).is(":checked") ){
      $.ajax({
            url: "/documents/registrar/" + documentoid,
            dataType: "JSON",
            timeout: 10000,
            success: function(res){
                $(img2doc).addClass('ocultar');
                $(img1doc).removeClass('ocultar');
            }
         })
     }
    else{
      $.ajax({
             url: "/documents/noregistrar/" + documentoid,
            dataType: "JSON",
            timeout: 10000,
            success: function(res){
              $(img1doc).addClass('ocultar');
                $(img2doc).removeClass('ocultar');
            }
         })
     }
};

/*
* función para el javascript
*/
 function openLoading(){
  $(document).ajaxStart(function(){
      $('#myModalLoading').foundation ('reveal', 'open');
    });
 };

 function closeLoading(){
    $(document).ajaxStop(function(){
      $('#myModalLoading').foundation ('reveal', 'close');
    });
 };

    function ocultarboton(){
      $('#commitCompartir').val("Enviando...");
      $('#commitDocumento').val("Cargando...");
    };

function activarreporteproceso(){
  $("#reporteGeneral").removeClass("ocultar");
  $("#panelReporteProceso").addClass("ocultar");
    $("#botonproceso").removeClass("desactivado");
  $("#botongeneral").addClass("desactivado");
};
function activarreportegeneral(){
 $("#panelReporteProceso").removeClass("ocultar");
  $("#reporteGeneral").addClass("ocultar");

   $("#botongeneral").removeClass("desactivado");
  $("#botonproceso").addClass("desactivado");
};