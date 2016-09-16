require 'rails_helper'

describe "the view profile process" do

  it 'takes a user to their profile page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_registration_path(user)
    fill_in "About", with: "test about content ..."
    fill_in "Skills", with: "test skills content"
    fill_in "Likes", with: "test likes content"
    fill_in "Likes", with: "test likes content"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    fill_in "Current password", with: user.password
    click_button "Update"
    expect(page).to have_content "Your account has been updated successfully."
  end

  it 'fails if the current password field is empty or incorrect' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_registration_path(user)
    fill_in "About", with: "test about content ..."
    fill_in "Skills", with: "test skills content"
    fill_in "Likes", with: "test likes content"
    fill_in "Likes", with: "test likes content"
    fill_in "Current password", with: "wrongpassword"
    click_button "Update"
    expect(page).to have_content "Current password is invalid"
  end

end
