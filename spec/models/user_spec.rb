require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:email)}

  context "no email address is provided" do
    it "user account is not created" do
      invalid_user = User.new(password: "pass", first_name: "brad", last_name: "green")

      expect(invalid_user).to be_invalid
    end
  end
  context "no password is provided" do
    it "user account is not created" do
      invalid_user = User.new(email: "green@brad.com", first_name: "brad", last_name: "green")

      expect(invalid_user).to be_invalid
    end
  end
  context "email already exists" do
    it "user account is not created" do
      User.create(email: "green@brad.com", password: "pass", first_name: "brad", last_name: "green")
      duplicate = User.new(email: "green@brad.com", password: "pass", first_name: "brad", last_name: "green")

      expect(duplicate).to be_invalid
    end
  end
  context "unique email and password are provided" do
    it "user account is created" do
      valid_user = User.new(email: "real@email.com", password: "pass", first_name: "brad", last_name: "green")

      expect(valid_user).to be_valid
    end
  end
end
