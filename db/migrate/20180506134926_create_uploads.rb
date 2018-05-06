class CreateUploads < ActiveRecord::Migration[5.1]
  def up
    create_table :uploads do |t|
      t.attachment :file

      t.timestamps
    end
  end

  def down
    drop_table :uploads
  end
end
