require 'rails_helper'

describe "a visitor" do
  context "viewing a video" do
    it "cannot delete the video" do
      user = User.create(email: "wtag@uoregon.edu", first_name: "willie", last_name: "taggart", username: "dosomething", password: "pass")
      piece = user.pieces.create(composer_first: "jacques", composer_last: "ibert", title: "concertino da camera", yt_link: "https://www.youtube.com/watch?v=X2_26iqxTUg", yt_uid: "X2_26iqxTUg")

      visit user_piece_path(user, piece)

      expect(page).to have_css(".yt-player")
      expect(page).to_not have_content("Delete Video")
    end
  end
end
