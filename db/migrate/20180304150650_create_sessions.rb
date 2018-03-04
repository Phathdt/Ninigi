class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions, id: :uuid do |t|
      t.references :user,   foreign_key: true,  type:    :uuid
      t.uuid       :token,  null:        false, default: 'uuid_generate_v4()'
      t.boolean    :active, default:     true

      t.timestamps
    end

    add_index :sessions, :token, unique: true
  end
end
