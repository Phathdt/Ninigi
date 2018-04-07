class AddIsActiveToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :is_active, :boolean, default: false
  end
end
