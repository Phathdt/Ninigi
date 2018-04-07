class RemoveUnitFromDish < ActiveRecord::Migration[5.1]
  def change
    remove_column :dishes, :unit, :integer
  end
end
