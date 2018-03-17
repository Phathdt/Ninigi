class AddLocaleToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :locale, :string, limit: 2, default: 'vi'
  end
end
