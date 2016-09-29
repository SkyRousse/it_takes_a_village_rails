require 'rails_helper'

describe "the add a pet path" do
  it "will allow a user to see all pets", js: true do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category)
    login_as(user)
    visit root_path
    click_link 'Pets'
    select 'walks'
    click_on 'Create Pet'
    expect(page).to have_content('Pet saved successfully')
  end
  it "will allow a user to sort pets", js: true do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category)
    login_as(user)
    visit root_path
    click_link 'Pets'
    select 'walks'
    click_on 'Create Pet'
    expect(page).to have_content('Pet saved successfully')
  end
end
