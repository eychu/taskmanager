class Web::StoriesController < Web::ApplicationController
  before_filter :require_login, only: [:new, :create, :destroy, :edit, :update, :next_state]
  before_filter(only: [:destroy, :edit, :update]) { |s| require_owner Story.find(params[:id]).user }

  def next_state

    return unless owner_or_assigned_user?

    @story = Story.find(params[:id])
    event = params[:event]
    if @story
      @story.fire_state_event(event)
      flash_success
    else
      flash_error
    end

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
    @story = Story.find(params[:id])
  end

  def create
    new_story_attrs = params[:story]
    new_story_attrs[:user_id] = current_user.id
    @story = Story.new(new_story_attrs)

    if @story.save
      flash_success
      redirect_to @story
    else
      flash_error
      render action: 'new'
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      flash_success
      redirect_to @story
    else
      flash_error
      render action: 'edit'
    end
  end

  def destroy
    @story = Story.find(params[:id])
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
