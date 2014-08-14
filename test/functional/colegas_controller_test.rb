require 'test_helper'

class ColegasControllerTest < ActionController::TestCase
  setup do
    @colega = colegas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colegas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colega" do
    assert_difference('Colega.count') do
      post :create, colega: { abogado1: @colega.abogado1, abogado2: @colega.abogado2, activo: @colega.activo }
    end

    assert_redirected_to colega_path(assigns(:colega))
  end

  test "should show colega" do
    get :show, id: @colega
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colega
    assert_response :success
  end

  test "should update colega" do
    put :update, id: @colega, colega: { abogado1: @colega.abogado1, abogado2: @colega.abogado2, activo: @colega.activo }
    assert_redirected_to colega_path(assigns(:colega))
  end

  test "should destroy colega" do
    assert_difference('Colega.count', -1) do
      delete :destroy, id: @colega
    end

    assert_redirected_to colegas_path
  end
end
