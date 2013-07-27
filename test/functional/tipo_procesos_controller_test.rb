require 'test_helper'

class TipoProcesosControllerTest < ActionController::TestCase
  setup do
    @tipo_proceso = tipo_procesos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_procesos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_proceso" do
    assert_difference('TipoProceso.count') do
      post :create, tipo_proceso: { tipo: @tipo_proceso.tipo }
    end

    assert_redirected_to tipo_proceso_path(assigns(:tipo_proceso))
  end

  test "should show tipo_proceso" do
    get :show, id: @tipo_proceso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_proceso
    assert_response :success
  end

  test "should update tipo_proceso" do
    put :update, id: @tipo_proceso, tipo_proceso: { tipo: @tipo_proceso.tipo }
    assert_redirected_to tipo_proceso_path(assigns(:tipo_proceso))
  end

  test "should destroy tipo_proceso" do
    assert_difference('TipoProceso.count', -1) do
      delete :destroy, id: @tipo_proceso
    end

    assert_redirected_to tipo_procesos_path
  end
end
