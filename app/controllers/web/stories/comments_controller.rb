class Web::Stories::CommentsController < Web::Stories::ApplicationController
  before_filter :require_login

  def create

    @comment = current_story.story_comments.build(params[:story_comment])
    @comment.user = current_user

    if @comment.save
      redirect_to @comment.story, notice: t('story_comment.save_success')
    else
      redirect_to request.referer, alert: t('story_comment.save_error')
    end
  end

  def destroy
    @comment = current_user.story_comments.find(params[:id])
    @comment.destroy

    redirect_to story_path(@comment.story)

  end

end
