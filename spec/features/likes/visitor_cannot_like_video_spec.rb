require 'rails_helper'

describe "a visitor" do
  context "viewing a user video" do
    it "cannot like the video" do
      other_user = User.create(email: "wtag@uoregon.edu", first_name: "willie", last_name: "taggart", username: "dosomething", password: "pass")
      piece = other_user.pieces.create(composer_first: "jacques", composer_last: "ibert", title: "concertino da camera", yt_link: "https://www.youtube.com/watch?v=X2_26iqxTUg", yt_uid: "X2_26iqxTUg")

      visit user_piece_path(other_user, piece)

      expect(page).to_not have_content("Like Video")
    end
  end
end
