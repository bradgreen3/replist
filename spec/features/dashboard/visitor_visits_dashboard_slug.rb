describe "as a visitor" do
  context "visiting the a slugged dashboard" do
    it "sees information about user" do

      user = User.create(email: "test@test.com", username: "testuser", password: "pass", password_confirmation: "pass", first_name: "brad", last_name: "green")

      visit "/#{user.username}"

      expect(page).to have_content("Repertoire")
      expect(page).to have_content("Performances")
    end
  end
end
