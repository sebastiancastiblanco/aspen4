# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


#Despliega y actualiza formualrio para compartir los procesos
formularioCompartirProceso = ->
  $("#formCompartirProceso").submit ->
    valuesToSubmit = $(this).serialize()
    #sumbits it to the given url of the form
    # you want a difference between normal and ajax-calls, and json is standard
    $.ajax(
      url: $(this).attr("action")
      data: valuesToSubmit
      dataType: "JSON"
    ).success (json) ->
      alert "submit desde ajax " + json[json.length - 1].id

    $.ajax
      url: "/procesos/cantidadUsuarios/" + gon.proceso_id
      dataType: "JSON"
      timeout: 10000
      success: (dataRes) ->
        $("#myModal").foundation "reveal", "close"
        document.getElementById("cantidadUsuarios").innerHTML = dataRes.length
        document.getElementById("listaUsuarios").innerHTML = document.getElementById("listaUsuarios").innerHTML + "<img class='avatar' height='40' src='/img/user_blue.png' width='40'> " + "<span class='posicionNombreUsuario'>" + dataRes[dataRes.length - 1].username + " </span> <br/>"

#Formulario para crear tipo de proceso
formularioCrearTipoProceso = ->
  $("#formCrearTipoProceso").submit ->
    valuesToSubmit = $(this).serialize()
    #sumbits it to the given url of the form
    # you want a difference between normal and ajax-calls, and json is standard
    $.ajax(
      url: $(this).attr("action")
      data: valuesToSubmit
      dataType: "JSON"
    ).success (dataRes) ->
      alert dataRes[dataRes.length - 1].tipo
      alert dataRes[dataRes.length - 1].id
      document.getElementById("listaTiposProceso").innerHTML = document.getElementById("listaTiposProceso").innerHTML + "<option value='" + dataRes[dataRes.length - 1].id + "' > " + dataRes[dataRes.length - 1].tipo + " </option>"
      $("#myModal").foundation "reveal", "close"


$(document).ready ->
  formularioCompartirProceso()
  formularioCrearTipoProceso()
  cambioEstadoFavoritoHome()