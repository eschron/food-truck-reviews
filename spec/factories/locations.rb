require 'factory_girl_rails'

FactoryGirl.define do
  factory :location do
    sequence(:body) { |n| "#{n}body" }
  end
end
