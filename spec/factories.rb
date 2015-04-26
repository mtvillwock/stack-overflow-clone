FactoryGirl.define do
  factory :question do
    title Faker::Hacker.adjective
    description Faker::Hacker.say_something_smart
    username Faker::App.name

  end

  factory :answer do
    body Faker::Hacker.say_something_smart
    username Faker::App.name
  end
end
