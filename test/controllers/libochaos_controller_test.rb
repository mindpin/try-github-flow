require 'test_helper'

class LibochaosControllerTest < ActionController::TestCase
  setup do
    @libochao = libochaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:libochaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create libochao" do
    assert_difference('Libochao.count') do
      post :create, libochao: {  }
    end

    assert_redirected_to libochao_path(assigns(:libochao))
  end

  test "should show libochao" do
    get :show, id: @libochao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @libochao
    assert_response :success
  end

  test "should update libochao" do
    patch :update, id: @libochao, libochao: {  }
    assert_redirected_to libochao_path(assigns(:libochao))
  end

  test "should destroy libochao" do
    assert_difference('Libochao.count', -1) do
      delete :destroy, id: @libochao
    end

    assert_redirected_to libochaos_path
  end
end
