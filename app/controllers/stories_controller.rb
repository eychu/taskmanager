class StoriesController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :destroy, :edit, :update, :next_state]
  before_filter(:only => [:destroy, :edit, :update]) { |s| require_owner Story.find(params[:id]).user }
  before_filter :require_owner_or_assigned_user, :only => :next_state

  def next_state
    notice = 'some errors'
    @story = Story.find(params[:id])
    state = params[:next_state]
    if @story && state.to_sym.in?(@story.state_events)
      @story.fire_state_event(state)
      notice = 'New state'
    end

    redirect_to @story, :notice => notice
  end

  # GET /stories
  def index
    @search = Story.search(params[:q])
    @stories = @search.result(:distinct => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /stories/1
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /stories/new
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  def create
    @story = Story.new(params[:story].merge(:user_id => current_user.id))

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /stories/1
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /stories/1
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
    end
  end

  private
  def require_owner_or_assigned_user
    unless current_user.in? [Story.find(params[:id]).user, User.find(Story.find(params[:id]).assign_to_user_id)]
      redirect_to root_path, :notice => 'only for owner or assigned user'
    end
  end

end
