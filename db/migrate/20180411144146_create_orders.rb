class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :address
      t.string :phone
      t.text :note
      t.integer :state, default: 0, null: false
      t.integer :amount, default: 0, null: false
      t.string :hash_id, null: false, index: true
      t.float :latitude
      t.float :longitude
      t.references :user, type: :uuid, foreign_key: true
      t.references :restaurant, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
