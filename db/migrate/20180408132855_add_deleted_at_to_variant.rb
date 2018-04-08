class AddDeletedAtToVariant < ActiveRecord::Migration[5.1]
  def change
    add_column :variants, :deleted_at, :datetime
    add_index :variants, :deleted_at
  end
end
