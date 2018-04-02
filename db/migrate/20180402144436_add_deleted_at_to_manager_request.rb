class AddDeletedAtToManagerRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :manager_requests, :deleted_at, :datetime
    add_index :manager_requests, :deleted_at
  end
end
