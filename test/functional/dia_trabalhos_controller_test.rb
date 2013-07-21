require 'test_helper'

class DiaTrabalhosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dia_trabalhos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dia_trabalho" do
    assert_difference('DiaTrabalho.count') do
      post :create, :dia_trabalho => { }
    end

    assert_redirected_to dia_trabalho_path(assigns(:dia_trabalho))
  end

  test "should show dia_trabalho" do
    get :show, :id => dia_trabalhos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dia_trabalhos(:one).to_param
    assert_response :success
  end

  test "should update dia_trabalho" do
    put :update, :id => dia_trabalhos(:one).to_param, :dia_trabalho => { }
    assert_redirected_to dia_trabalho_path(assigns(:dia_trabalho))
  end

  test "should destroy dia_trabalho" do
    assert_difference('DiaTrabalho.count', -1) do
      delete :destroy, :id => dia_trabalhos(:one).to_param
    end

    assert_redirected_to dia_trabalhos_path
  end
end
