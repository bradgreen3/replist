require 'rails_helper'

describe "a logged in authorized youtube user" do
  context "viewing a user video" do
    it "can like the video", :vcr do
      user = stub_login_user
      YoutubeUser.create(user_id: user.id, token: ENV['token'], account_number: ENV['account_number'])

      other_user = User.create(email: "wtag@uoregon.edu", first_name: "willie", last_name: "taggart", username: "dosomething", password: "pass")
      piece = other_user.pieces.create(composer_first: "jacques", composer_last: "ibert", title: "concertino da camera", yt_link: "https://www.youtube.com/watch?v=X2_26iqxTUg", yt_uid: "X2_26iqxTUg")

      visit user_piece_path(other_user, piece)
      click_on "Like Video"

      expect(page).to have_content("Liked!")
      expect(current_path).to eq(user_piece_path(other_user, piece))
    end
  end
end