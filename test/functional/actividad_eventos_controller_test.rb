require 'test_helper'

class ActividadEventosControllerTest < ActionController::TestCase
  setup do
    @actividad_evento = actividad_eventos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actividad_eventos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actividad_evento" do
    assert_difference('ActividadEvento.count') do
      post :create, actividad_evento: { actividad_id: @actividad_evento.actividad_id, descripcion: @actividad_evento.descripcion, fecha: @actividad_evento.fecha, horas: @actividad_evento.horas, usuario_id: @actividad_evento.usuario_id }
    end

    assert_redirected_to actividad_evento_path(assigns(:actividad_evento))
  end

  test "should show actividad_evento" do
    get :show, id: @actividad_evento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actividad_evento
    assert_response :success
  end

  test "should update actividad_evento" do
    put :update, id: @actividad_evento, actividad_evento: { actividad_id: @actividad_evento.actividad_id, descripcion: @actividad_evento.descripcion, fecha: @actividad_evento.fecha, horas: @actividad_evento.horas, usuario_id: @actividad_evento.usuario_id }
    assert_redirected_to actividad_evento_path(assigns(:actividad_evento))
  end

  test "should destroy actividad_evento" do
    assert_difference('ActividadEvento.count', -1) do
      delete :destroy, id: @actividad_evento
    end

    assert_redirected_to actividad_eventos_path
  end
end
