class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions, id: :uuid do |t|
      t.references :user,   type:    :uuid, foreign_key: true
      t.string     :token,  null:    false, limit:       256
      t.boolean    :active, default: true

      t.timestamps
    end

    add_index :sessions, :token, unique: true
  end
end
