# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider 'twitter'
    uid { 10000000 + rand(9999999) }
    username { Faker::Lorem.word }
    token { Faker::Lorem.characters(100) }
    secret { Faker::Lorem.characters(100) }
  end
end
