# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users

community_array = [North, North East, North West, South East, South West, East]

10.times do
  User.create(
              first_name:FFaker::Internet.first_name,
              last_name:FFaker::Internet.last_name,
              email:FFaker::Internet.email,
              password:123456,
              zip_code:97217,
              dob:FFaker::Time.date,
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
  "walks",
  "feeding",
  "training",
  "play dates",
  "day care",
  "overnight care"
]

pet_category_list.each do |name|
  PetCategory.create(name: name)
end

30.times do
  Pet.create(
              name:FFaker::Name.name,
              species:"dog",
              age:
              about:FFaker::HipsterIpsum.paragraph,
              )
end
