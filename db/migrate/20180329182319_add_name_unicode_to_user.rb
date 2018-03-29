class AddNameUnicodeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name_unicode, :string

    add_index :users, :name_unicode
  end
end
