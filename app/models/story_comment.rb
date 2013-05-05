class StoryComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  attr_accessible :text, :user_id, :story_id

  validates_presence_of :user, :story, :text

end
