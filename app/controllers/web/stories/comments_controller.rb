class Web::Stories::CommentsController < Web::Stories::ApplicationController
  before_filter :require_login

  #FIXME как это можно улучшить?
  before_filter(only: [:destroy]) { |sc| sc.require_owner StoryComment.find(params[:id]).user}

  def create
    new_comment_params = params[:story_comment]
    new_comment_params[:user_id] = current_user.id
    new_comment_params[:story_id] = params[:story_id]

    @story_comment = StoryComment.new(new_comment_params)

      if @story_comment.save
      redirect_to @comment.story, notice: t('story_comment.save_success')
      else
      redirect_to request.referer, alert: t('story_comment.save_error')
      end
  end

  def destroy
    @story_comment = StoryComment.find(params[:id])
    @story_comment.destroy

    redirect_to story_path(@story_comment.story)

  end

end
