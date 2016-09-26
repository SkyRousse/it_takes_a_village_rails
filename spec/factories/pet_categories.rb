require 'ffaker'

FactoryGirl.define do
  factory :pet_category do
    name { [ "day care", 'feeding', 'overnight care', 'play dates', 'training', 'walks' ].sample }
  end
end
