require 'rails_helper'

describe "a not logged in visitor" do
  it "can see all performances for a user" do

    user = User.create(email: "wtag@uoregon.edu", first_name: "willie", last_name: "taggart", username: "dosomething", password: "pass")
    other_user = User.create(email: "wtagg@uoregon.edu", first_name: "willieg", last_name: "taggartg", username: "dosomethingg", password: "pass")
    user.performances.create(title: "senior recital", date: "2011-01-01")
    user.performances.create(title: "junior recital", date: "2010-01-01")
    other_user.performances.create(title: "sophomore recital", date: "2005-01-01")

    visit user_performances_path(user)
    expect(page).to have_content("senior recital")
    expect(page).to have_content("junior recital")
    expect(page).to_not have_content("sophomore recital")
  end
end
