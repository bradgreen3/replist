class AddAccountNumberToYoutubeUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :youtube_users, :account_number, :string
  end
end
