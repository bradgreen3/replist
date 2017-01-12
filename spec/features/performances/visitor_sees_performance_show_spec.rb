require 'rails_helper'

describe "a not logged in visitor" do
  it "can a performances for a user", :vcr do

    user = User.create(email: "wtag@uoregon.edu", first_name: "willie", last_name: "taggart", username: "dosomething", password: "pass")

    performance = user.performances.create(title: "senior recital", date: "2011-01-01")
    piece = Piece.create(title: "blah", composer_last: "hah", composer_first: "yah")
    PerformancePiece.create(piece_id: piece.id, performance_id: performance.id)

    visit user_performances_path(user)
    click_on("senior recital")

    expect(page).to have_content("senior recital")
  end
end
