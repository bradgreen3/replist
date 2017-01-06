require 'rails_helper'

describe "a logged in user" do
  context "can create a new piece" do
    it "and see it displayed in their rep list" do

      other_user = User.create(email: "daltman@uoregon.edu", password: "pass", first_name: "Dana", last_name: "Altman")
      other_piece = Piece.create(composer_first: "Paul", composer_last: "Creston", title: "Sonata", user_id: other_user)

      stub_login_user

      visit pieces_path

      click_button "New Piece"

      expect(current_path).to eq(new_piece_path)

      fill_in "Composer's Last", with: "Ibert"
      fill_in "Composer's First", with: "Jacques"
      fill_in "Title of Piece", with: "Concertino da Camera"

      click_button "Add Piece"

      expect(current_path).to eq(pieces_path)
      expect(page).to have_content("Ibert")
      expect(page).to have_content("Concertino da Camera")
      expect(page).to_not have_content("Paul Creston")

    end
  end
end