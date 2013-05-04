class Story < ActiveRecord::Base
  belongs_to :user
  attr_accessible :assign_to_user_id, :description, :state, :title
end
