require 'test_helper'

class RolParticipantesControllerTest < ActionController::TestCase
  setup do
    @rol_participante = rol_participantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rol_participantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rol_participante" do
    assert_difference('RolParticipante.count') do
      post :create, rol_participante: { rol: @rol_participante.rol }
    end

    assert_redirected_to rol_participante_path(assigns(:rol_participante))
  end

  test "should show rol_participante" do
    get :show, id: @rol_participante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rol_participante
    assert_response :success
  end

  test "should update rol_participante" do
    put :update, id: @rol_participante, rol_participante: { rol: @rol_participante.rol }
    assert_redirected_to rol_participante_path(assigns(:rol_participante))
  end

  test "should destroy rol_participante" do
    assert_difference('RolParticipante.count', -1) do
      delete :destroy, id: @rol_participante
    end

    assert_redirected_to rol_participantes_path
  end
end
