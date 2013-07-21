require 'test_helper'

class EstabelecimentoProfissionalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estabelecimento_profissionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estabelecimento_profissional" do
    assert_difference('EstabelecimentoProfissional.count') do
      post :create, :estabelecimento_profissional => { }
    end

    assert_redirected_to estabelecimento_profissional_path(assigns(:estabelecimento_profissional))
  end

  test "should show estabelecimento_profissional" do
    get :show, :id => estabelecimento_profissionals(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => estabelecimento_profissionals(:one).to_param
    assert_response :success
  end

  test "should update estabelecimento_profissional" do
    put :update, :id => estabelecimento_profissionals(:one).to_param, :estabelecimento_profissional => { }
    assert_redirected_to estabelecimento_profissional_path(assigns(:estabelecimento_profissional))
  end

  test "should destroy estabelecimento_profissional" do
    assert_difference('EstabelecimentoProfissional.count', -1) do
      delete :destroy, :id => estabelecimento_profissionals(:one).to_param
    end

    assert_redirected_to estabelecimento_profissionals_path
  end
end
