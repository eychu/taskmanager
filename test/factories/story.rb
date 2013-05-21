FactoryGirl.define do
  factory :story do |s|
    user
    assign_to_user_id { create(:user).id }
    description
    title
    s.after(:build){ |story| story.send(:initialize_state_machines, dynamic: :force)}
  end

end
