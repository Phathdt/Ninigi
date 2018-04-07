class AddDeletedAtToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :deleted_at, :datetime
    add_index :dishes, :deleted_at
  end
end
