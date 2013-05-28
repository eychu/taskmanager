class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :stories, dependent: :destroy
  has_many :story_comments, dependent: :destroy
  has_many :assigned_stories, class_name: 'Story', foreign_key: 'assign_to_user_id'

  validates :password, presence: true, on: :create

  validates :email, presence: true,
                    length: {minimum: 5, maximum: 254},
                    uniqueness: true,
                    format: {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  end
