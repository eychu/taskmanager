FactoryGirl.define do
  factory 'story/comment' do
    user
    story
    text
  end
end
