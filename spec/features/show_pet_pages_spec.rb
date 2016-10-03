require 'rails_helper'

describe "the view pet details process" do
  it "allows a user to visit the show pet page" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pet_category, name: "Walks")
    test_pet = FactoryGirl.create(:pet, pet_category_id: 1, user_id: 1)
    login_as(user, :scope => :user)
    visit pets_path
    click_link test_pet.name.titleize
    expect(page).to have_content test_pet.name
  end
end
