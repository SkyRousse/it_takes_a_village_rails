require 'rails_helper'

describe "the delete pet process" do
  it "removes the pet from the database"  do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "Walks")
    test_pet = FactoryGirl.create(:pet, pet_category_id: 1, user_id: 1)
    login_as(user, :scope => :user)
    visit pet_path(test_pet)
    save_and_open_page
    click_on "Delete"
    expect(page).to have_content "Pet deleted"
  end
  it "fails to remove pet if not current user"  do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, email: "user2@fake.com")
    FactoryGirl.create(:pet_category, name: "Walks")
    test_pet = FactoryGirl.create(:pet, pet_category_id: 1, user_id: 2)
    login_as(user1, :scope => :user)
    visit pet_path(test_pet)
    click_on "Delete"
    expect(page).to have_content "Pet not deleted only pet owners can remove pets"
  end
end
