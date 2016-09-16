require 'rails_helper'

describe "the view profile process" do

  it 'takes a user to their profile page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_on "Profile"
    expect(page).to have_content user.first_name
  end

  it "restricts access to user page and redirects to signin" do
    user = FactoryGirl.create(:user)
    visit user_path(user)
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

end
