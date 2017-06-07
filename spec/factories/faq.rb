FactoryGirl.define do
  factory :faq do
    question FFaker::Lorem.phrase
    answer FFaker::Lorem.phrase
    faq_type Faq.faq_types.keys.sample
    company
  end
end
