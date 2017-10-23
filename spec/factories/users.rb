require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'f4k3p455w0rd'
    sequence(:first_name) { |n| "Bob#{n}" }
    sequence(:last_name) { |n| "Loblaw#{n}" }
  end
end
