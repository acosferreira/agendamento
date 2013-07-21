require 'test_helper'

class PermissaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:permissaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create permissao" do
    assert_difference('Permissao.count') do
      post :create, :permissao => { }
    end

    assert_redirected_to permissao_path(assigns(:permissao))
  end

  test "should show permissao" do
    get :show, :id => permissaos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => permissaos(:one).to_param
    assert_response :success
  end

  test "should update permissao" do
    put :update, :id => permissaos(:one).to_param, :permissao => { }
    assert_redirected_to permissao_path(assigns(:permissao))
  end

  test "should destroy permissao" do
    assert_difference('Permissao.count', -1) do
      delete :destroy, :id => permissaos(:one).to_param
    end

    assert_redirected_to permissaos_path
  end
end
