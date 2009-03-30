require File.dirname(__FILE__) + '/../test_helper'

class RecipesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_recipe
    assert_difference('Recipe.count') do
      post :create, :recipe => { }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  def test_should_show_recipe
    get :show, :id => recipes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => recipes(:one).id
    assert_response :success
  end

  def test_should_update_recipe
    put :update, :id => recipes(:one).id, :recipe => { }
    assert_redirected_to recipe_path(assigns(:recipe))
  end

  def test_should_destroy_recipe
    assert_difference('Recipe.count', -1) do
      delete :destroy, :id => recipes(:one).id
    end

    assert_redirected_to recipes_path
  end
end
