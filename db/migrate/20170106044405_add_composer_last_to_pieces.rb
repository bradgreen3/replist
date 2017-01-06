class AddComposerLastToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :composer_last, :string
  end
end
