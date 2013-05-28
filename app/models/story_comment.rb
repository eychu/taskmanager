class StoryComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  attr_accessible :text, :user_id, :story_id

  validates :user, presence: true
  validates :story, presence: true
  validates :text, presence: true

end
