require 'test_helper'

class ContratosControllerTest < ActionController::TestCase
  setup do
    @contrato = contratos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contratos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contrato" do
    assert_difference('Contrato.count') do
      post :create, contrato: { deberes: @contrato.deberes, fechaFin: @contrato.fechaFin, fechaInicio: @contrato.fechaInicio, formaPago: @contrato.formaPago, objeto: @contrato.objeto, obligaciones: @contrato.obligaciones, participante2: @contrato.participante2, particpante1: @contrato.particpante1, tipoContrato: @contrato.tipoContrato, valor: @contrato.valor }
    end

    assert_redirected_to contrato_path(assigns(:contrato))
  end

  test "should show contrato" do
    get :show, id: @contrato
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contrato
    assert_response :success
  end

  test "should update contrato" do
    put :update, id: @contrato, contrato: { deberes: @contrato.deberes, fechaFin: @contrato.fechaFin, fechaInicio: @contrato.fechaInicio, formaPago: @contrato.formaPago, objeto: @contrato.objeto, obligaciones: @contrato.obligaciones, participante2: @contrato.participante2, particpante1: @contrato.particpante1, tipoContrato: @contrato.tipoContrato, valor: @contrato.valor }
    assert_redirected_to contrato_path(assigns(:contrato))
  end

  test "should destroy contrato" do
    assert_difference('Contrato.count', -1) do
      delete :destroy, id: @contrato
    end

    assert_redirected_to contratos_path
  end
end
