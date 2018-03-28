class AddNameUnicodeToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :name_unicode, :string

    add_index :restaurants, :name_unicode
  end
end
