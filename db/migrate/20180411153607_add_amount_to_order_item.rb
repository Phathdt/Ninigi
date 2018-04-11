class AddAmountToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :amount, :integer, default: 0, null: false
  end
end
