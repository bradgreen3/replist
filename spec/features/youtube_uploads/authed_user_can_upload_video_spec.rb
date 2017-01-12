require 'rails_helper'

describe "a logged in authorized youtube user" do
  context "viewing their own piece without a video" do
    it "can upload a video", :vcr do

      user = stub_login_user
      YoutubeUser.create(user_id: user.id, token: ENV['token'], account_number: ENV['account_number'])

      piece = Piece.create(composer_first: "jacques", composer_last: "ibert", title: "concertino da camera", user_id: user.id, yt_link: "", yt_uid: "")

      visit user_piece_path(user, piece)

      click_on "Upload Video"

      attach_file("file", Rails.root + "spec/fixtures/hurricane.mpg")

      fill_in "Title", with: "RSpec"
      fill_in "Description", with: "Testing"
      click_on "Upload"

      expect(page).to have_content("Your video has been uploaded!")
      expect(current_path).to eq(user_piece_path(user, piece))
    end
  end
end
