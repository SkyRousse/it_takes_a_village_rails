require 'rails_helper'

describe "the view pets path" do
  it "will allow a user to see all pets" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "Walks")
    FactoryGirl.create(:pet, pet_category_id: 1)
    login_as(user)
    visit pets_path
    expect(page).to have_content('Walks')
  end
  it "will allow a user to sort pets", js: true do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "Walks")
    FactoryGirl.create(:pet_category, name: "Feeding")
    FactoryGirl.create(:pet_category, name: "Day Care")
    FactoryGirl.create_list(:pet, 2, pet_category_id:1)
    FactoryGirl.create_list(:pet, 2, pet_category_id:2)
    FactoryGirl.create_list(:pet, 2, pet_category_id:3)
    login_as(user)
    visit pets_path
    click_on 'Need Help With'
    sleep 1
    expect(page.find('tr:nth-child(2)')).to have_content "Walks"  end
end
