class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery

  def require_owner(user)
    redirect_to root_path, :notice => 'Only owner' unless owner? user
  end

  def require_login
    redirect_to root_path, :notice => 'Please login' unless authorized?
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if authorized?
  end
  helper_method :current_user


end
