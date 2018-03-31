class AddCommentToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :comment, :text
  end
end
