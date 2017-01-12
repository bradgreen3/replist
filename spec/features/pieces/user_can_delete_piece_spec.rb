require 'rails_helper'

describe "a logged in user" do
  it "can delete an existing piece" do

    stub_login_user

    user = User.find_by(email: "brad@test.com")

    user.pieces.create(composer_first: "Paul", composer_last: "Creston", title: "Sonata", yt_link: "")
    user.pieces.create(composer_first: "Paul", composer_last: "Creston", title: "Concerto", yt_link: "")

    piece = Piece.find_by(title: "Sonata")

    visit user_pieces_path(user)

    within(".delete-#{piece.title}") do
      find(:xpath, ".//a[@href='/users/#{user.id}/pieces/#{piece.id}']").click
    end

    expect(current_path).to eq(user_pieces_path(user))
    expect(page).to have_content("Deleted!")
    expect(page).to have_content("Concerto")
    expect(page).to_not have_content("Sonata")
  end
end
