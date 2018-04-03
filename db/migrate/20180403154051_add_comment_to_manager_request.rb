class AddCommentToManagerRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :manager_requests, :comment, :text
  end
end
