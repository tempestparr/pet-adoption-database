require 'test_helper'

class SavedPetsControllerTest < ActionController::TestCase
  setup do
    @saved_pet = saved_pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saved_pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saved_pet" do
    assert_difference('SavedPet.count') do
      post :create, saved_pet: {  }
    end

    assert_redirected_to saved_pet_path(assigns(:saved_pet))
  end

  test "should show saved_pet" do
    get :show, id: @saved_pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saved_pet
    assert_response :success
  end

  test "should update saved_pet" do
    patch :update, id: @saved_pet, saved_pet: {  }
    assert_redirected_to saved_pet_path(assigns(:saved_pet))
  end

  test "should destroy saved_pet" do
    assert_difference('SavedPet.count', -1) do
      delete :destroy, id: @saved_pet
    end

    assert_redirected_to saved_pets_path
  end
end
