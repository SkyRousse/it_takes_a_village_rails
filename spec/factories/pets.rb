
FactoryGirl.define do
  factory :pet do
    name FFaker::Name.first_name
    species "MyString"
    age { ["dog", "cat", "bird", "chickens", "goat"].sample }
    category_id { [1 , 2, 3, 4, 5, 6].sample }
    about FFaker::HipsterIpsum.paragraph
  end
end
