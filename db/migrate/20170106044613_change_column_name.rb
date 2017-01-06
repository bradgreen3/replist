class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :pieces, :composer, :composer_first
  end
end
