class Story::Comment < ActiveRecord::Base

  belongs_to :story
  belongs_to :user

  attr_accessible :text

  validates :user, presence: true
  validates :story, presence: true
  validates :text, presence: true
end
