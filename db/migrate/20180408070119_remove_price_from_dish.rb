class RemovePriceFromDish < ActiveRecord::Migration[5.1]
  def change
    remove_column :dishes, :price, :integer
  end
end
