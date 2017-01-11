class CreatePerformancePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :performance_pieces do |t|
      t.references :performance, foreign_key: true
      t.references :piece, foreign_key: true

      t.timestamps
    end
  end
end
