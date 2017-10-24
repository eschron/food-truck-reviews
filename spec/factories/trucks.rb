require 'factory_girl_rails'

FactoryGirl.define do
  factory :truck do
    name 'Yummy Food'
    description 'The yummiest food'

    association :user, factory: :user
    association :location, factory: :location
  end
end
