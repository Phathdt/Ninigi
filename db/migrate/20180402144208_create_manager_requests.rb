class CreateManagerRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_requests, id: :uuid do |t|
      t.references :restaurant, type: :uuid, foreign_key: true
      t.references :user, type: :uuid, foreign_key: true
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
