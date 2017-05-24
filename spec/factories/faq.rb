FactoryGirl.define do
  factory :faq do
    question FFaker::Lorem.phrase
    answear FFaker::Lorem.phrase
    company
  end
end
