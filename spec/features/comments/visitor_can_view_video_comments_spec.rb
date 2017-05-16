require 'rails_helper'

describe "as a visitor", js: :true do
  context "viewing a piece with a youtube video" do
    it "i see comments for video", :vcr do
      user = stub_login_user
      piece = user.pieces.create(composer_last: "Ibert", composer_first: "Jacques", title: "Concertino da Camera", yt_link: "https://www.youtube.com/watch?v=H7iJIp_C32A", yt_uid: "H7iJIp_C32A")
      id = "H7iJIp_C32A"

      visit user_piece_path(user, piece)

      find(:css, '#yt-comments').click

      expect(page).to have_content("Best Ibert I heard since Marcel Mule!﻿")
    end
  end
end
