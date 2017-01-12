require 'rails_helper'

describe "When a user goes to logout" do
  it "the user can logout and session is destroyed" do
    stub_login_user

    visit "/"

    page.find(:xpath, "//a[@href='/logout']").click

    expect(current_path).to eq(root_path)

  end
end
