class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :stories, dependent: :destroy
  has_many :comments, class_name: 'Story::Comment', dependent: :destroy
  has_many :assigned_stories, class_name: 'Story', foreign_key: 'assign_to_user_id'

  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    email: true

  end
