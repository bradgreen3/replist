require 'rails_helper'

describe "when a user goes to login page" do
  context "they can log in with their credentials" do
    it "and be redirected to their dashboard" do
      user = User.create(email: "test@test.com", password: "pass", first_name: "brad", last_name: "green")

      visit "/login"

      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "pass"

      click_button "Login"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("brad")
    end
  end
end
