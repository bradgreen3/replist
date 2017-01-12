require 'rails_helper'

describe "a logged in user" do
  it "can edit an existing piece" do

    stub_login_user

    user = User.find_by(email: "brad@test.com")
    user.pieces.create(composer_first: "Paul", composer_last: "Creston", title: "Sonata", yt_link: "")
    piece = Piece.first

    visit user_pieces_path(user)
    page.find(:xpath, "//a[@href='/users/#{user.id}/pieces/#{piece.id}/edit']").click

    fill_in "Title of Piece", with: "Concerto"

    click_on "Edit Piece"

    expect(current_path).to eq(user_pieces_path(user))
    expect(page).to have_content("Concerto")
    expect(page).to_not have_content("Sonata")
  end
  it "cannot edit an existing piece with bad attributes" do

    stub_login_user

    user = User.find_by(email: "brad@test.com")
    user.pieces.create(composer_first: "Paul", composer_last: "Creston", title: "Sonata", yt_link: "")
    piece = Piece.first

    visit user_pieces_path(user)
    page.find(:xpath, "//a[@href='/users/#{user.id}/pieces/#{piece.id}/edit']").click

    fill_in "YouTube URL", with: "invalidurl"

    click_on "Edit Piece"

    expect(page).to have_content("Invalid Attributes")
    expect(current_path).to eq(edit_user_piece_path(user, piece))
  end
end
