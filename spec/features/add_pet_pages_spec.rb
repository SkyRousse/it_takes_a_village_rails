require 'rails_helper'

describe "the add a pet path" do
  it "will allow a user to add a new pet", js: true do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "Walks")
    login_as(user)
    visit root_path
    click_link 'Pets'
    click_link 'Add New'
    fill_in "Name", with: 'Peluche'
    fill_in "Species", with: 'Dog'
    fill_in "Age", with: 'young-pup'
    fill_in "About", with: 'Best Dog Ever'
    select 'Walks'
    click_on 'Create Pet'
    sleep 1
    expect(page).to have_content('Pet saved successfully')
  end
  it "will fail to save if not all required fields are entered" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "Walks")
    login_as(user)
    visit root_path
    click_link 'Pets'
    click_link 'Add New'
    fill_in "Species", with: 'Dog'
    fill_in "Age", with: 'young-pup'
    fill_in "About", with: 'Best Dog Ever'
    select 'Walks'
    click_on 'Create Pet'
    expect(page).to have_content('Pet failed to save, please try again')
  end
end
