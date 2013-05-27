require 'test_helper'

class Web::Stories::CommentsControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    sign_in @user
    @story = create :story
    @comment = create :story_comment
  end

  test 'should create comment' do
    attrs = attributes_for :story_comment
    post :create, story_comment: attrs, story_id: @story
    assert_response :redirect
  end

  #TODO сделать правильную проверку после редиректа во всех подобных местах
  test 'should destroy comment' do
    sign_in @comment.user
    delete :destroy, id: @comment, story_id: @story
    assert_response :redirect
  end
end
