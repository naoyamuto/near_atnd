FactoryGirl.define do
  factory :attendee do
    association :user
    association :event
    status 'attended'
  end
end
