class Web::StoryCommentsController < Web::ApplicationController
  before_filter :require_login
  before_filter(:only => [:destroy]) { |sc| sc.require_owner StoryComment.find(params[:id]).user}

  def create
    @story_comment = StoryComment.new(params[:story_comment].merge(:user_id => current_user.id).merge(:story_id => params[:story_id]))

      if @story_comment.save
        redirect_to @story_comment.story, notice: 'Story comment was successfully created.'
      else
        redirect_to request.referer
      end
  end

  def destroy
    @story_comment = StoryComment.find(params[:id])
    @story_comment.destroy

    redirect_to story_path(@story_comment.story)

  end

end
