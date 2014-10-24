require 'test_helper'

class TypecatesControllerTest < ActionController::TestCase
  setup do
    @typecate = typecates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:typecates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create typecate" do
    assert_difference('Typecate.count') do
      post :create, typecate: { name: @typecate.name }
    end

    assert_redirected_to typecate_path(assigns(:typecate))
  end

  test "should show typecate" do
    get :show, id: @typecate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @typecate
    assert_response :success
  end

  test "should update typecate" do
    patch :update, id: @typecate, typecate: { name: @typecate.name }
    assert_redirected_to typecate_path(assigns(:typecate))
  end

  test "should destroy typecate" do
    assert_difference('Typecate.count', -1) do
      delete :destroy, id: @typecate
    end

    assert_redirected_to typecates_path
  end
end
