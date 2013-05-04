class StoryComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  attr_accessible :text
end
