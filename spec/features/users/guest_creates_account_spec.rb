require 'rails_helper'

describe "a not logged in user" do
  it "can create an account" do
    visit new_user_path

    fill_in 'Email', with: "brad@test.com"
    fill_in 'Username', with: "testuser"
    fill_in 'Password', with: "password"
    fill_in 'Retype password', with: "password"
    fill_in 'First Name', with: "Brad"
    fill_in 'Last Name', with: "Green"

    click_button "Create Account"

    user = User.find_by(email: "brad@test.com")

    expect(current_path).to eq(user_dashboard_path(user))
    expect(page).to have_content("Account for brad@test.com created")
  end
  it "is redirected if unable to create account" do
    visit new_user_path

    fill_in 'Email', with: "green@test.com"
    fill_in 'First Name', with: "Brad"
    fill_in 'Last Name', with: "Green"
    fill_in 'Username', with: "quackquack"

    click_button "Create Account"

    expect(page).to have_content("can't be blank")
  end
end
