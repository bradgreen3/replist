require 'rails_helper'

describe "a logged in user" do
  context "can create a new piece" do
    it "and see it displayed in their rep list" do

      other_user = User.create(email: "daltman@uoregon.edu", username: "ballcoach", password: "pass", first_name: "Dana", last_name: "Altman")
      other_piece = other_user.pieces.create(composer_first: "Paul", composer_last: "Creston", title: "Sonata", yt_link: "")

      stub_login_user

      user = User.find_by(email: "brad@test.com")

      visit user_pieces_path(user)

      click_button "New Piece"

      expect(current_path).to eq(new_user_piece_path(user))

      fill_in "piece[composer_last]", with: "Ibert"
      fill_in "piece[composer_first]", with: "Jacques"
      fill_in "piece[title]", with: "Concertino da Camera"

      click_button "Add Piece"

      expect(current_path).to eq(user_pieces_path(user))
      expect(page).to have_content("Ibert")
      expect(page).to have_content("Concertino da Camera")
      expect(page).to_not have_content("Paul Creston")

    end
  end
  context "cannot create a new piece with bad attributes" do
    it "and sees a flash message" do

      other_user = User.create(email: "daltman@uoregon.edu", username: "ballcoach", password: "pass", first_name: "Dana", last_name: "Altman")
      other_piece = other_user.pieces.create(composer_first: "Paul", composer_last: "Creston", title: "Sonata", yt_link: "")

      stub_login_user

      user = User.find_by(email: "brad@test.com")

      visit user_pieces_path(user)

      click_button "New Piece"

      expect(current_path).to eq(new_user_piece_path(user))

      fill_in "piece[composer_last]", with: "Ibert"
      fill_in "piece[composer_first]", with: "Jacques"
      fill_in "piece[title]", with: "Concertino da Camera"
      fill_in "piece[yt_link]", with: "notvalidurl"

      click_button "Add Piece"

      expect(page).to have_content("Invalid Attributes")
      expect(current_path).to eq(new_user_piece_path(user))

    end
  end
end
