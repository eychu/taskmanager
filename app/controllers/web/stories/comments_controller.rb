class Web::Stories::CommentsController < Web::Stories::ApplicationController
  before_filter :require_login

  def create

    @comment = current_story.story_comments.build(params[:story_comment])
    @comment.user = current_user

    if @comment.save
      flash_success
      redirect_to @comment.story
    else
      flash_error
      redirect_to request.referer
    end
  end

  def destroy
    @comment = current_user.story_comments.find(params[:id])
    @comment.destroy

    redirect_to story_path(@comment.story)

  end

end
