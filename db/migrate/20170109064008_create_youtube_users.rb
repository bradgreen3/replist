class CreateYoutubeUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :youtube_users do |t|
      t.string :user_id
      t.string :token

      t.timestamps
    end
  end
end
