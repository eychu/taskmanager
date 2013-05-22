class Web::ApplicationController < ApplicationController
  include Web::SessionsHelper
  include AuthHelper

  protect_from_forgery

  def require_owner(user)
    redirect_to root_path, notice: 'Only owner' unless owner? user
  end

  def require_login
    redirect_to root_path, notice: 'Please login' unless signed_in?
  end

end
