FactoryGirl.define do

  sequence :email do |n|
    "email_#{n}@example.com"
  end

  [:title, :description, :text].each do |trait|
    sequence trait do |n|
      "#{trait}_#{n}"
    end

  end


end
