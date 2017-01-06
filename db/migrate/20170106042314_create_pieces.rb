class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.string :composer
      t.string :title
      t.references :user, foreign_key: true
      t.string :soundcloud_track_id

      t.timestamps
    end
  end
end
