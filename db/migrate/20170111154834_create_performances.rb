class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.string :title
      t.date :date

      t.timestamps
    end
  end
end
