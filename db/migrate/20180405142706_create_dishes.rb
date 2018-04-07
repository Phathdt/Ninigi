class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes, id: :uuid do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :unit
      t.boolean :active, default: false
      t.string :temp_url
      t.references :restaurant, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
