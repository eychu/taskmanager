class Web::StoriesController < Web::ApplicationController
  before_filter :require_login, only: [:new, :create, :destroy, :edit, :update, :next_state]
  before_filter(only: [:destroy, :edit, :update]) { |s| require_owner Story.find(params[:id]).user }
  before_filter :require_owner_or_assigned_user, only: :next_state

  def next_state
    notice = t('story.next_stage.error')
    @story = Story.find(params[:id])
    state = params[:next_state]
    if @story && state.to_sym.in?(@story.state_events)
      @story.fire_state_event(state)
      notice = t('story.next_stage.success')
    end

    redirect_to @story, notice: notice
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

    if @story.save then
      redirect_to @story, notice: t('story.created')
    else
      render action: 'new'
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to @story, notice: t('story.updated')
    else
      render action: 'edit'
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_url

  end

  private
  def require_owner_or_assigned_user
    story = Story.find(params[:id])
    unless current_user.in? [story.user, story.assign_to_user]
      redirect_to root_path, notice: t('story.only_for_owner_or_assigned_user')
    end
  end

end
