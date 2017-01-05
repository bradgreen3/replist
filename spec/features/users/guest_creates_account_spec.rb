require 'rails_helper'

describe "a not logged in user" do
  it "can create an account" do
    visit new_user_path

    fill_in 'Email', with: "brad@test.com"
    fill_in 'Password', with: "password"
    fill_in 'Retype password', with: "password"
    fill_in 'First Name', with: "Brad"
    fill_in 'Last Name', with: "Green"

    click_button "Create Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Account for brad@test.com created")
  end
  it "is redirected if unable to create account" do
    visit new_user_path

    fill_in 'Email', with: "green@test.com"
    fill_in 'First Name', with: "Brad"
    fill_in 'Last Name', with: "Green"

    click_button "Create Account"

    expect(current_path).to eq(new_user_path)
  end
end
