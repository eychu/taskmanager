class Web::ApplicationController < ApplicationController
  include Web::SessionsHelper
  include AuthHelper

  protect_from_forgery

  def require_owner(user)
    redirect_to root_path, notice: t(:only_owner) unless owner? user
  end

  def require_login
    redirect_to root_path, notice: t(:please_login) unless signed_in?
  end

end
