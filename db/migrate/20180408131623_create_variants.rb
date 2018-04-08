class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants, id: :uuid do |t|
      t.string :size, blank: false
      t.integer :price, default: 0
      t.references :dish, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
