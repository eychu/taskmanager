class UserRegistrationType < User
  include BasicType

  #attr_accessible :password_confirmation

  validates :password_digest, presence: true

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end

end