class Web::StoriesController < Web::ApplicationController
  before_filter :require_login, only: [:new, :create, :destroy, :edit, :update, :next_state]

  def next_state

    return unless owner_or_assigned_user?

    @story = Story.find(params[:id])
    @story.fire_state_event(params[:event])
    flash_success

    redirect_to @story
  end

  def index
    @search = Story.search(params[:q])
    @stories = @search.result(distinct: true)
  end

  def show
    @story = Story.find(params[:id])

  end

  def new
    @story = Story.new

  end

  def edit
    @story = current_user.stories.find(params[:id])
  end

  def create
    @story =  current_user.stories.build params[:story]

    if @story.save
      flash_success
      redirect_to @story
    else
      flash_error
      render action: 'new'
    end
  end

  def update
    @story = current_user.stories.find(params[:id])
    if @story.update_attributes(params[:story])
      flash_success
      redirect_to @story
    else
      flash_error
      render action: 'edit'
    end
  end

  def destroy
    @story = current_user.stories.find(params[:id])
    @story.destroy

    flash_success
    redirect_to stories_url

  end

  private
  def owner_or_assigned_user?
    story = Story.find(params[:id])
    current_user.in? [story.user, story.assign_to_user]
  end

end
