require 'ffaker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users

community_array = ["North", "North East", "North West", "South East", "South West", "East"]
zip_code_array = ["97202", "97206", "97219", "97124", '97202', '97206', '97219']
address_array = [
  "111 5th Ave, Portland, OR 97204", "128 NE Russell St, Portland, OR 97212", "3120 N Williams Ave, Portland, OR 97227", "830 E Burnside St, Portland, OR 97214", "3433 NE 24th Ave, Portland, OR 97212", "
  928 SE 9th Ave, Portland, OR 97214", "915 SE Hawthorne Blvd, Portland, OR 97214", "1504 NE Broadway St, Portland, OR 97232", "6400 N Interstate Ave, Portland, OR 97217"
]

10.times do
  User.create(
              first_name:FFaker::Name.first_name,
              last_name:FFaker::Name.last_name,
              email:FFaker::Internet.email,
              password:123456,
              zip_code:zip_code_array.sample,
              street_address:address_array.sample,
              dob:FFaker::Time.between(18.years.ago, 90.years.ago),
              about:FFaker::HipsterIpsum.paragraph,
              skills:FFaker::HipsterIpsum.words,
              likes:FFaker::HipsterIpsum.words,
              gender:FFaker::Gender.random,
              community:community_array.sample,
              avatar:FFaker::Avatar.image
              )
end

# PETS

pet_category_list = [
  "day care",
  "feeding",
  "overnight care",
  "play dates",
  "training",
  "walks"
]

pet_category_list.each do |name|
  PetCategory.create(name: name)
end

pet_life_stages_array = ["young-pup", "pup", "young-adult", "adult", "old-&-wise"]
species_array = ["dog", "cat", "bird", "chickens", "goat"]

50.times do
  Pet.create(
              name:FFaker::Name.first_name,
              species:species_array.sample,
              age:pet_life_stages_array.sample,
              about:FFaker::HipsterIpsum.paragraph,
              user_id:rand(1..10),
              # avatar:FFaker::Avatar.image,
              pet_category_id:rand(1..6)
              )
end
