require 'rails_helper'

describe "a visitor" do
  it "sees home screen as root page" do

    visit root_path

    expect(page).to have_content("Welcome to RepList!")
    expect(page).to have_content("Create Account")
    expect(page).to have_content("Log In")

  end
end
