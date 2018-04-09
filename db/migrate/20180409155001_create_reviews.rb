class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews, id: :uuid do |t|
      t.text :content
      t.integer :point, default: 0
      t.references :reviewable, type: :uuid, polymorphic: true
      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
