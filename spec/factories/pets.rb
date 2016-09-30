
FactoryGirl.define do
  factory :pet do
    name FFaker::Name.first_name
    species { ["dog", "cat", "bird", "chickens", "goat"].sample }
    age { ["young-pup", "pup", "young-adult", "adult", "old-&-wise"].sample }
    pet_category_id { [1 , 2, 3].sample }
    about FFaker::HipsterIpsum.paragraph
    user_id 1
  end
end
