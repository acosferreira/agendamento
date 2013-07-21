require 'test_helper'

class ProfissionalEspecialidadesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profissional_especialidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profissional_especialidade" do
    assert_difference('ProfissionalEspecialidade.count') do
      post :create, :profissional_especialidade => { }
    end

    assert_redirected_to profissional_especialidade_path(assigns(:profissional_especialidade))
  end

  test "should show profissional_especialidade" do
    get :show, :id => profissional_especialidades(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => profissional_especialidades(:one).to_param
    assert_response :success
  end

  test "should update profissional_especialidade" do
    put :update, :id => profissional_especialidades(:one).to_param, :profissional_especialidade => { }
    assert_redirected_to profissional_especialidade_path(assigns(:profissional_especialidade))
  end

  test "should destroy profissional_especialidade" do
    assert_difference('ProfissionalEspecialidade.count', -1) do
      delete :destroy, :id => profissional_especialidades(:one).to_param
    end

    assert_redirected_to profissional_especialidades_path
  end
end
