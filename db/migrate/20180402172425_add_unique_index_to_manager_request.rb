class AddUniqueIndexToManagerRequest < ActiveRecord::Migration[5.1]
  def change
    add_index :manager_requests, [:restaurant_id, :user_id], unique: true
  end
end
