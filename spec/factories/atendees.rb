FactoryGirl.define do
  factory :atendee do
    association :user
    association :event
    status 'attended'
  end
end
