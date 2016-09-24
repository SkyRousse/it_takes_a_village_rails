require 'rails_helper'

describe "the new user signup process" do

  it "creates a new user in the db" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: 'FistNameTest'
    fill_in "Last name", with: 'LastNameTest'
    fill_in "Email", with: 'test@example.com'
    fill_in "Dob", with: '1993-02-27'
    fill_in "Gender", with: 'M'
    fill_in "Community", with: 'N PDX'
    fill_in "Street address", with: '1111 Fake Street'
    fill_in "Password", with: "mySecreteCode"
    fill_in "Password confirmation", with: "mySecreteCode"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "fails to create new user if fields are blank" do
    visit root_path
    click_on "Sign Up"
    click_button "Sign up"
    expect(page).to have_content "errors prohibited this user from being saved"
  end

end
