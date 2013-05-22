class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :assign_to_user, class_name: User
  has_many :story_comments, dependent: :destroy

  attr_accessible :assign_to_user_id, :description, :state, :title, :user_id

  validates :title, presence: true
  validates :user_id, presence: true
  validates :assign_to_user_id, presence: true
  validates :description, presence: true

  state_machine :state, initial: :new do

    event :start do
      transition new: :started
    end

    event :finish do
      transition started: :finished
    end

    event :accept do
      transition finished: :accepted
    end

    event :reject do
      transition finished: :rejected
    end

    event :restart do
      transition rejected: :started
    end

  end
end
