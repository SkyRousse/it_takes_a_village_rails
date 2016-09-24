describe "the add a food path" do
  it "will allow a user to see all pets", js: true do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:category)
    login_as(user)
    visit '/'
    click_link 'Pets'
    select 'walks'
    click_on 'Create Pet'
    expect(page).to have_content('Pet saved successfully')
  end
  it "will allow a user to sort pets", js: true do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:category)
    login_as(user)
    visit '/'
    click_link 'Pets'
    select 'walks'
    click_on 'Create Pet'
    expect(page).to have_content('Pet saved successfully')
  end
end
