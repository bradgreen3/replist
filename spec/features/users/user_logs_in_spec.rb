require 'rails_helper'

describe "when a user goes to login page" do
  context "they can log in with their credentials" do
    it "and be redirected to their dashboard" do
      user = User.create(email: "test@test.com", username: "testuser", password: "pass", password_confirmation: "pass", first_name: "brad", last_name: "green")

      visit "/login"

      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "pass"

      click_on "Login"

      expect(current_path).to eq(user_dashboard_path(user))

      expect(page).to have_content("testuser")
    end
  end
  describe "and fills in wrong credentials" do
    it "they cannot log in" do
      user = User.create(email: "brad@test.com", username: "testuser", password: "pass", first_name: "brad", last_name: "green")

      visit "/login"

      fill_in "Email", with: "brad@test.com"
      fill_in "Password", with: "wrongpassword"

      click_on "Login"

      expect(current_path).to eq("/login")
      expect(page).to have_content("Invalid account information")
    end
  end
end
