class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants, id: :uuid do |t|
      t.string     :name
      t.string     :address
      t.string     :phone
      t.text       :desc
      t.integer    :state, default: 0, null: false
      t.float      :latitude
      t.float      :longitude
      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
