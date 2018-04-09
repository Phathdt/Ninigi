class AddReviewsCountToRestaurants < ActiveRecord::Migration[5.1]
  def self.up
    add_column :restaurants, :review_count, :integer, null: false, default: 0
    add_column :restaurants, :review_point, :integer, null: false, default: 0
  end

  def self.down
    remove_column :restaurants, :review_count
    remove_column :restaurants, :review_point
  end
end
