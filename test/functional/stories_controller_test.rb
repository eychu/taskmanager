require 'test_helper'

class Web::StoriesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user
    @story = create :story
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create story' do
    attrs = attributes_for :story
    assert_difference('Story.count') do
      post :create, story:attrs
    end
    assert_response :redirect
  end

  test 'should show story' do
    get :show, id: @story
    assert_response :success
  end

  test 'should get edit' do
    sign_in @story.user
    get :edit, id: @story
    assert_response :success
  end

  test 'should update story' do
    attrs = attributes_for :story
    put :update, id: @story, story: attrs
    assert_response :redirect
  end

  test 'should destroy story' do
    sign_in @story.user
    assert_difference('Story.count', -1) do
      delete :destroy, id: @story
    end
    assert_response :redirect
  end
end
