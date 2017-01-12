require "rails_helper"

describe "a logged in user" do
  context "can add an existing piece to a performance" do
    it "and see the piece tied to in their performance" do
      user = stub_login_user
      performance = user.performances.create(title: "recital", date: "10/10/2010")
      piece = user.pieces.create(composer_first: "jacques", composer_last: "ibert", title: "concertino da camera", yt_link: "https://www.youtube.com/watch?v=p-b6I1ihh2s", yt_uid: "p-b6I1ihh2s")

      visit user_performance_path(user, performance)

      click_on "Add Piece"

      select 'concertino da camera', from: "piece_title"
      click_on "Submit"

      expect(current_path).to eq(user_performance_path(user, performance))
      expect(page).to have_content("ibert")
    end
  end
end
