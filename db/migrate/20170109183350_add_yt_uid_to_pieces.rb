class AddYtUidToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :yt_uid, :string
  end
end
