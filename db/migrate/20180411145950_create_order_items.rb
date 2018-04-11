class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items, id: :uuid do |t|
      t.references :order, type: :uuid, foreign_key: true
      t.references :variant, type: :uuid, foreign_key: true
      t.integer :price, default: 0, null: false
      t.integer :quantity, default: 0, null: false

      t.timestamps
    end
  end
end
