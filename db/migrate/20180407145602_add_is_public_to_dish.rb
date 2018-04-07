class AddIsPublicToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :is_public, :boolean, default: false
  end
end
