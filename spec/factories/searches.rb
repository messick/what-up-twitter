# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :search do
    term "MyString"
    last_cached_at "2013-05-23 22:05:57"
  end
end
