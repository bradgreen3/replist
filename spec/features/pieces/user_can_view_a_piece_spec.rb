require 'rails_helper'

describe "from the pieces index page" do
  it "you can view an individual piece" do

    user = User.create(email: "daltman@uoregon.edu", username: "ballcoach", password: "pass", first_name: "Dana", last_name: "Altman")
    piece = user.pieces.create(composer_first: "Paul", composer_last: "Creston", title: "Sonata", yt_link: "")

    visit user_piece_path(user, piece)

    expect(page).to have_content(piece.title)
    expect(page).to have_content(piece.composer_first)
    expect(page).to have_content(piece.composer_last)

  end
end
