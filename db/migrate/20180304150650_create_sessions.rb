class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.string :sessiion_code, limit: 36
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :sessions, :sessiion_code, unique: true
  end
end
