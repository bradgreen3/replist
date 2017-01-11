class RemoveYoutubeUrlFromPieces < ActiveRecord::Migration[5.0]
  def change
    remove_column :pieces, :youtube_url, :string
  end
end
