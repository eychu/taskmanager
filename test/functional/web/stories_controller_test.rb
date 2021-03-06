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
    attrs = build_attributes :story
    post :create, story: attrs
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
    delete :destroy, id: @story
    assert_response :redirect
  end
end
