if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ## Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  ##
  ## Note: You'll currently still have to declare fixtures explicitly in integration tests
  ## -- they do not yet inherit this setting
  #fixtures :all
  #
  ## Add more helper methods to be used by all tests here...
  include AuthHelper
  require 'factory_girl_rails'
  include FactoryGirl::Syntax::Methods

  def build_attributes(*args)
    FactoryGirl.build(*args).attributes.delete_if do |k, v|
      ["id", "created_at", "updated_at", "state"].member?(k)
    end
  end

end
