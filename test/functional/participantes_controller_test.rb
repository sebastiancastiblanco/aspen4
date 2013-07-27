require 'test_helper'

class ParticipantesControllerTest < ActionController::TestCase
  setup do
    @participante = participantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participante" do
    assert_difference('Participante.count') do
      post :create, participante: { apellido: @participante.apellido, celular: @participante.celular, correo: @participante.correo, direccion: @participante.direccion, documento: @participante.documento, estadoCivil: @participante.estadoCivil, fechaNacimiento: @participante.fechaNacimiento, genero: @participante.genero, nombre: @participante.nombre, telefono: @participante.telefono, tipoDocumento: @participante.tipoDocumento }
    end

    assert_redirected_to participante_path(assigns(:participante))
  end

  test "should show participante" do
    get :show, id: @participante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participante
    assert_response :success
  end

  test "should update participante" do
    put :update, id: @participante, participante: { apellido: @participante.apellido, celular: @participante.celular, correo: @participante.correo, direccion: @participante.direccion, documento: @participante.documento, estadoCivil: @participante.estadoCivil, fechaNacimiento: @participante.fechaNacimiento, genero: @participante.genero, nombre: @participante.nombre, telefono: @participante.telefono, tipoDocumento: @participante.tipoDocumento }
    assert_redirected_to participante_path(assigns(:participante))
  end

  test "should destroy participante" do
    assert_difference('Participante.count', -1) do
      delete :destroy, id: @participante
    end

    assert_redirected_to participantes_path
  end
end
