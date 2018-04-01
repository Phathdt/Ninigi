class AddDeletedAtToAlbumImage < ActiveRecord::Migration[5.1]
  def change
    add_column :album_images, :deleted_at, :datetime
    add_index :album_images, :deleted_at
  end
end
