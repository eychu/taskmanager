class Web::Stories::ApplicationController < Web::ProtectedApplicationController

  helper_method :current_story

  def current_story
    @current_story = Story.find params[:story_id]
  end

end
