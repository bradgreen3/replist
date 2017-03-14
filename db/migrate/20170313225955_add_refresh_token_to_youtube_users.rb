class AddRefreshTokenToYoutubeUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :youtube_users, :refresh_token, :string
    add_column :youtube_users, :expires_at, :timestamp
  end
end
