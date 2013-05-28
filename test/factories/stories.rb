FactoryGirl.define do
  factory :story do |s|
    user
    association :assign_to_user, factory: :user
    description
    title
  end

end
