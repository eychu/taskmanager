FactoryGirl.define do
  factory :story do |s|
    user
    association :assign_to_user, factory: :user
    description
    title
    s.after(:build){ |story| story.send(:initialize_state_machines, dynamic: :force)}
  end

end
