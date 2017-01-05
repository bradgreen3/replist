require 'rails_helper'

describe "when a user logs out" do
  xit "their session is deleted and they are redirected" do
    stub_login_user

    #click on a logout button, wherever it ends up being placed

    expect(current_path).to eq(root_path)
  end
end
