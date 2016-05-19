# require 'factory_girl_rails'

# ユーザーデータ
10.times do
  FactoryGirl.create :user
end

# イベントデータ
10.times do
  FactoryGirl.create :event
end
