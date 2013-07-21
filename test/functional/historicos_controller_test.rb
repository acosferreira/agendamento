require 'test_helper'

class HistoricosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historico" do
    assert_difference('Historico.count') do
      post :create, :historico => { }
    end

    assert_redirected_to historico_path(assigns(:historico))
  end

  test "should show historico" do
    get :show, :id => historicos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => historicos(:one).to_param
    assert_response :success
  end

  test "should update historico" do
    put :update, :id => historicos(:one).to_param, :historico => { }
    assert_redirected_to historico_path(assigns(:historico))
  end

  test "should destroy historico" do
    assert_difference('Historico.count', -1) do
      delete :destroy, :id => historicos(:one).to_param
    end

    assert_redirected_to historicos_path
  end
end
