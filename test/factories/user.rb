FactoryGirl.define do
  factory :user do
    email
    password BCrypt::Password.create('please')
  end

end
