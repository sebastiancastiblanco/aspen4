require 'test_helper'

class SoftwareAbogadosControllerTest < ActionController::TestCase
  setup do
    @software_abogado = software_abogados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:software_abogados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create software_abogado" do
    assert_difference('SoftwareAbogado.count') do
      post :create, software_abogado: { correo: @software_abogado.correo, nombre: @software_abogado.nombre }
    end

    assert_redirected_to software_abogado_path(assigns(:software_abogado))
  end

  test "should show software_abogado" do
    get :show, id: @software_abogado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @software_abogado
    assert_response :success
  end

  test "should update software_abogado" do
    put :update, id: @software_abogado, software_abogado: { correo: @software_abogado.correo, nombre: @software_abogado.nombre }
    assert_redirected_to software_abogado_path(assigns(:software_abogado))
  end

  test "should destroy software_abogado" do
    assert_difference('SoftwareAbogado.count', -1) do
      delete :destroy, id: @software_abogado
    end

    assert_redirected_to software_abogados_path
  end
end
