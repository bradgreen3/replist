class AddPieceIdToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :piece_id, :string
  end
end
