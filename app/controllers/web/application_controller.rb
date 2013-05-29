class Web::ApplicationController < ApplicationController
  include Web::SessionsHelper
  include FlashHelper

  protect_from_forgery

end
