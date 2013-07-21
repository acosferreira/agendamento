require 'test_helper'

class TypeConvenioEspecialidadesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_convenio_especialidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_convenio_especialidade" do
    assert_difference('TypeConvenioEspecialidade.count') do
      post :create, :type_convenio_especialidade => { }
    end

    assert_redirected_to type_convenio_especialidade_path(assigns(:type_convenio_especialidade))
  end

  test "should show type_convenio_especialidade" do
    get :show, :id => type_convenio_especialidades(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => type_convenio_especialidades(:one).to_param
    assert_response :success
  end

  test "should update type_convenio_especialidade" do
    put :update, :id => type_convenio_especialidades(:one).to_param, :type_convenio_especialidade => { }
    assert_redirected_to type_convenio_especialidade_path(assigns(:type_convenio_especialidade))
  end

  test "should destroy type_convenio_especialidade" do
    assert_difference('TypeConvenioEspecialidade.count', -1) do
      delete :destroy, :id => type_convenio_especialidades(:one).to_param
    end

    assert_redirected_to type_convenio_especialidades_path
  end
end
