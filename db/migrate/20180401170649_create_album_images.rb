class CreateAlbumImages < ActiveRecord::Migration[5.1]
  def change
    create_table :album_images, id: :uuid do |t|
      t.text       :caption
      t.boolean    :is_cover, default: false
      t.string     :temp_url
      t.attachment :photo
      t.references :restaurant, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
