require 'test_helper'

class Web::Stories::CommentsControllerTest < ActionController::TestCase

  setup do
    @story = create :story
    @comment = create :story_comment
    @user = @comment.user
    sign_in @user
    @params = {story_id: @story.id}
  end

  test 'should create comment' do
    attrs = attributes_for :story_comment
    post :create, @params.merge(story_comment: attrs)

    assert_response :redirect
    comment = StoryComment.last
    assert comment
  end

  test 'should destroy comment' do
    delete :destroy, @params.merge(id: @comment)

    assert_response :redirect
    assert !StoryComment.exists?(@comment)
  end
end
