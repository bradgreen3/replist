require 'rails_helper'

describe "a logged in user" do
  xit "can create a new performance" do

    user = stub_login_user

    visit user_performances_path(user)

    click_on "Add Performance"

    fill_in "Title", :with => "Recital"
    fill_in "performance[date]", :with => "01/10/2017"
    click_on "Add Performance"

    expect(current_path).to eq(user_performances_path(user))
    expect(page).to have_content("Recital")

  end
  xit "cannot create a performance with bad attributes" do
    user = stub_login_user

    visit user_performances_path(user)

    click_on "Add Performance"

    fill_in "performance[date]", :with => "01/10/2017"
    click_on "Add Performance"

    expect(current_path).to eq(user_performances_path(user))
    expect(page).to have_content("Oops! There was a problem")

  end
end
