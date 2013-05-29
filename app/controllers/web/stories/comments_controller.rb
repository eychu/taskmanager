class Web::Stories::CommentsController < Web::Stories::ApplicationController

  def create

    @comment = current_story.comments.build(params[:story_comment])
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
    @comment = current_user.comments.find(params[:id])
    @comment.destroy

    redirect_to story_path(@comment.story)

  end

end
