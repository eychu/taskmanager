class StoryCommentsController < ApplicationController
  before_filter :require_login
  before_filter(:only => [:destroy]) { |sc| sc.require_owner StoryComment.find(params[:id]).user}

  # POST /story_comments
  def create
    @story_comment = StoryComment.new(params[:story_comment].merge(:user_id => current_user.id).merge(:story_id => params[:story_id]))

    respond_to do |format|
      if @story_comment.save
        format.html { redirect_to @story_comment.story, notice: 'Story comment was successfully created.' }
      else
        format.html { redirect_to request.referer }
      end
    end
  end

  # DELETE /story_comments/1
  def destroy
    @story_comment = StoryComment.find(params[:id])
    story = @story_comment.story
    @story_comment.destroy

    respond_to do |format|
      format.html { redirect_to story_path(story) }
    end
  end

end
