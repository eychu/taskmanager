require 'test_helper'

class Web::StoryCommentsControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    sign_in @user
    @story = create :story
    @story_comment = create :story_comment
  end

  test 'should create story_comment' do
    attrs = attributes_for :story_comment
    assert_difference('StoryComment.count') do
      post :create, story_comment: attrs, story_id: @story
    end
    assert_response :redirect
  end

  test 'should destroy story_comment' do
    sign_in @story_comment.user
    assert_difference('StoryComment.count', -1) do
      delete :destroy, id: @story_comment, story_id: @story
    end
    assert_response :redirect
  end
end
