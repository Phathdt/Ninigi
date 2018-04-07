class RemoveActiveFromDish < ActiveRecord::Migration[5.1]
  def change
    remove_column :dishes, :active, :boolean
  end
end
