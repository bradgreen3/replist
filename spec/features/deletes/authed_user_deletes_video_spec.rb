require 'rails_helper'

describe "a logged in authorized youtube user" do
  context "viewing their own video" do
    it "can delete the video", :vcr do
      user = stub_login_user
      YoutubeUser.create(user_id: user.id, token: ENV['token'], account_number: ENV['account_number'])
      piece = user.pieces.create(composer_first: "jacques", composer_last: "ibert", title: "concertino da camera", yt_link: "https://www.youtube.com/watch?v=g3c025V9zuM", yt_uid: "g3c025V9zuM")

      visit user_piece_path(user, piece)

      find(:xpath, "//a[@href='/youtube/deletes?piece_id=#{piece.id}&yt_id=g3c025V9zuM']").click

      expect(page).to have_content("Deleted!")
      expect(current_path).to eq(user_piece_path(user, piece))
      expect(page).to_not have_css(".yt-player")
    end
  end
end
