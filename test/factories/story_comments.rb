FactoryGirl.define do
  factory :story_comment, :class => 'Story::Comment' do
    user
    story
    text
  end
end
