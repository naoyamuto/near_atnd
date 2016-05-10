FactoryGirl.define do
  factory :user do
    uid { Faker::Number.number 6 }
    name { Faker::Internet.user_name }
    nickname { Faker::Superhero.name }
    image { Faker::Company.logo }
    description { Faker::StarWars.quote }
    token { "#{Faker::Number.number 8 }-#{Faker::Number.hexadecimal 41}" }
    secret { Faker::Number.hexadecimal 45 }

    trait :with_events do
      after(:create) do |user|
        3.times do
          create :event, user: user
        end
      end
    end
  end
end
