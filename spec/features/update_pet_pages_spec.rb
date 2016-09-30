require 'rails_helper'

describe "the edit pet details process" do
  it "allows a user to update pet info" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "Walks")
    test_pet = FactoryGirl.create(:pet, pet_category_id: 1, user_id: 1)
    login_as(user, :scope => :user)
    visit pet_path(test_pet)
    click_on "Edit"
    fill_in "Age", with: "Forever Young"
    click_on "Update Pet"
    expect(page).to have_content "Pet updated"
  end
  it "fails to update if require fields are missing" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "Walks")
    test_pet = FactoryGirl.create(:pet, pet_category_id: 1, user_id: 1)
    login_as(user, :scope => :user)
    visit pet_path(test_pet)
    click_on "Edit"
    fill_in "Name", with: ""
    click_on "Update Pet"
    expect(page).to have_content "Pet update failed"
  end
  it "fails to update if current user is not pet owner" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, email: "user2@fake.com")
    FactoryGirl.create(:pet_category, name: "Walks")
    test_pet = FactoryGirl.create(:pet, pet_category_id: 1, user_id: 1)
    login_as(user2, :scope => :user)
    visit edit_pet_path(test_pet)
    expect(page).to have_content "Only pet owners can update pet info"
  end
end
