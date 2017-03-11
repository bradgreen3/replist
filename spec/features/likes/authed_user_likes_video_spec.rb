require 'rails_helper'

# will need to be updated for AJAX

describe "a logged in authorized youtube user" do
  context "viewing a user video" do
    xit "can like the video", :vcr do
      user = stub_login_user
      YoutubeUser.create(user_id: user.id, token: ENV['token'], account_number: ENV['account_number'])

      other_user = User.create(email: "wtag@uoregon.edu", first_name: "willie", last_name: "taggart", username: "dosomething", password: "pass")
      piece = other_user.pieces.create(composer_first: "jacques", composer_last: "ibert", title: "concertino da camera", yt_link: "https://www.youtube.com/watch?v=g3c025V9zuM", yt_uid: "g3c025V9zuM")

      visit user_piece_path(other_user, piece)
      find(:xpath, "//a[@href='/youtube/likes?id=g3c025V9zuM&piece=#{piece.id}&vid_owner=#{other_user.id}']").click

      expect(page).to have_content("Liked!")
      expect(current_path).to eq(user_piece_path(other_user, piece))
    end
  end
end
