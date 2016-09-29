require 'rails_helper'

describe "the add a pet path" do
  it "will allow a user to see all pets", js: true do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "walks")
    FactoryGirl.create(:pet_category, name: "feeding")
    FactoryGirl.create(:pet_category, name: "day care")
    login_as(user)
    visit root_path
    click_link 'Pets'
    click_link 'Add New'
    select 'walks'
    click_on 'Create Pet'
    expect(page).to have_content('Pet saved successfully')
  end
  it "will allow a user to sort pets", js: true do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "walks")
    FactoryGirl.create(:pet_category, name: "feeding")
    FactoryGirl.create(:pet_category, name: "day care")
    FactoryGirl.create(:pet)
    login_as(user)
    visit pets_path
    select 'walks'
    click_on 'Create Pet'
    expect(page).to have_content('Pet saved successfully')
  end
end
