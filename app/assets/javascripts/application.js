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


function cambioEstadoProceso (procesoid){

    $.ajax({
            url: "/procesos/estadoProceso/"+procesoid+"/"+$('#listaEstadoProceso').val(),
            dataType: "JSON",
            timeout: 10000,
            success: function(res){
            }
         })
};

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
    url: '/events/move/'+the_event.id,  //the script to call to get data          
    data: {id: the_event.id,minute_delta: minuteDelta, day_delta: dayDelta, all_day: allDay } ,                      //you can insert url argumnets here to pass to api.php
    success: function()          //on receive of reply
    {
        
    } 
  });
}

function resizeEvent(the_event,dayDelta,minuteDelta,allDay) {
  $.ajax({  
    type: 'GET',                                    
    url: '/events/resize/'+the_event.id,  //the events resize function.         
    data: {id: the_event.id,minute_delta: minuteDelta, day_delta: dayDelta, all_day: allDay },                      //you can insert url argumnets here to pass to api.php
    success: function()          //on receive of reply
    {
     
    } 
  });
}

function editEvent(the_event, jsEvent, view) {
  $.ajax({  
    type: 'GET',                                    
    url: '/events/'+the_event.id+'/edit',  //the script to call to get data          
    success: function()          //on receive of reply
    {
      $('#event_starttime').val($.fullCalendar.formatDate( the_event.start , 'dd MMMM yyyy'));
      if (the_event.end != null){
       $('#event_endtime').val($.fullCalendar.formatDate( the_event.end , 'dd MMMM yyyy'));
      }
      else{
       $('#event_endtime').val($.fullCalendar.formatDate( the_event.start , 'dd MMMM yyyy')); 
      } 
    } 
  });
}
function newEvent(date) {
  $.ajax({  
    type: 'GET',                                    
    url: '/events/new',  //the script to call to get data          
    data: {date: date} ,
    success: function()          //on receive of reply
    {
      $('#event_starttime').val($.fullCalendar.formatDate( date , 'dd MMMM yyyy'));
      $('#event_endtime').val($.fullCalendar.formatDate( date , 'dd MMMM yyyy'));
    } 
  });
}


$(document).ready(function(){
  $('#noticeMsg').hide();
  $(document).foundation('joyride', 'start');

    $('#calendar').fullCalendar({
          events: '/events',
          editable:true,
          
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

