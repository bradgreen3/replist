require 'rails_helper'

RSpec.describe Piece, type: :model do
  it {should validate_presence_of(:title)}
  it {should belong_to(:user) }

  context "no title is provided" do
    it "piece is not created" do
      invalid_piece = Piece.new(composer_last: "Creston", composer_first: "Paul", title: "Sonata", user_id: 1)

      expect(invalid_piece).to be_invalid
    end
  end
end
