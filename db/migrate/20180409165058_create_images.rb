class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images, id: :uuid do |t|
      t.string :temp_url
      t.references :review, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
