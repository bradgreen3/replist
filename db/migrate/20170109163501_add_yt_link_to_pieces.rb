class AddYtLinkToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :yt_link, :string
  end
end
