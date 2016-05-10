FactoryGirl.define do
  factory :event do
    association :user
    title { Faker::Lorem.word }
    hold_at { Faker::Time.between(Time.zone.now, Time.zone.now + 7.day) }
    capacity { Faker::Number.between(1, 100) }
    location { Faker::Lorem.sentence }
    owner { Faker::Superhero.name }
    description { Faker::Lorem.paragraph }
  end
end
