FactoryGirl.define do
  factory :question do
    title Faker::Hacker.adjective
    description Faker::Hacker.say_something_smart
    username Faker::App.name

  end

  # factory :incomplete_question do
  #   title Faker::Hacker.ingverb
  #   description Faker::Hacker.abbreviation
  #   username Faker::App.name
  # end

  factory :answer do
    body Faker::Hacker.say_something_smart
    username Faker::App.name
  end
end
