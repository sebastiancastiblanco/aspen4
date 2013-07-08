require 'test_helper'

class ProcesosControllerTest < ActionController::TestCase
  setup do
    @proceso = procesos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:procesos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proceso" do
    assert_difference('Proceso.count') do
      post :create, proceso: { ciudad: @proceso.ciudad, favorito: @proceso.favorito, objetivo: @proceso.objetivo, procesoHomologado: @proceso.procesoHomologado, referencia: @proceso.referencia, resumen: @proceso.resumen, titulo: @proceso.titulo }
    end

    assert_redirected_to proceso_path(assigns(:proceso))
  end

  test "should show proceso" do
    get :show, id: @proceso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proceso
    assert_response :success
  end

  test "should update proceso" do
    put :update, id: @proceso, proceso: { ciudad: @proceso.ciudad, favorito: @proceso.favorito, objetivo: @proceso.objetivo, procesoHomologado: @proceso.procesoHomologado, referencia: @proceso.referencia, resumen: @proceso.resumen, titulo: @proceso.titulo }
    assert_redirected_to proceso_path(assigns(:proceso))
  end

  test "should destroy proceso" do
    assert_difference('Proceso.count', -1) do
      delete :destroy, id: @proceso
    end

    assert_redirected_to procesos_path
  end
end
