require 'test_helper'

class ControlAccesosControllerTest < ActionController::TestCase
  setup do
    @control_acceso = control_accesos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_accesos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_acceso" do
    assert_difference('ControlAcceso.count') do
      post :create, control_acceso: { controlAcceso_id: @control_acceso.controlAcceso_id }
    end

    assert_redirected_to control_acceso_path(assigns(:control_acceso))
  end

  test "should show control_acceso" do
    get :show, id: @control_acceso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @control_acceso
    assert_response :success
  end

  test "should update control_acceso" do
    put :update, id: @control_acceso, control_acceso: { controlAcceso_id: @control_acceso.controlAcceso_id }
    assert_redirected_to control_acceso_path(assigns(:control_acceso))
  end

  test "should destroy control_acceso" do
    assert_difference('ControlAcceso.count', -1) do
      delete :destroy, id: @control_acceso
    end

    assert_redirected_to control_accesos_path
  end
end
