require 'rails_helper'

describe "the login process" do

  it 'logs a user in' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  it 'fails when user types wrong password' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "thewrongpassword"
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password"
  end

  it 'logs a user out' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_on "Log Out"
    expect(page).to have_content "Signed out successfully."
  end

end
