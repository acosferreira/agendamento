require 'test_helper'

class TypeConveniosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_convenios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_convenio" do
    assert_difference('TypeConvenio.count') do
      post :create, :type_convenio => { }
    end

    assert_redirected_to type_convenio_path(assigns(:type_convenio))
  end

  test "should show type_convenio" do
    get :show, :id => type_convenios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => type_convenios(:one).to_param
    assert_response :success
  end

  test "should update type_convenio" do
    put :update, :id => type_convenios(:one).to_param, :type_convenio => { }
    assert_redirected_to type_convenio_path(assigns(:type_convenio))
  end

  test "should destroy type_convenio" do
    assert_difference('TypeConvenio.count', -1) do
      delete :destroy, :id => type_convenios(:one).to_param
    end

    assert_redirected_to type_convenios_path
  end
end
