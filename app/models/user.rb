class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :stories, :dependent => :destroy
  has_many :story_comments, :dependent => :destroy

  validates_presence_of :password, :on => :create

  validates :email, :presence => true,
            :length => {:minimum => 5, :maximum => 254},
            :uniqueness => true,
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

end
