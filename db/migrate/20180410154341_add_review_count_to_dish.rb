class AddReviewCountToDish < ActiveRecord::Migration[5.1]
  def self.up
    add_column :dishes, :review_count, :integer, null: false, default: 0
    add_column :dishes, :review_point, :integer, null: false, default: 0
  end

  def self.down
    remove_column :dishes, :review_count
    remove_column :dishes, :review_point
  end
end
