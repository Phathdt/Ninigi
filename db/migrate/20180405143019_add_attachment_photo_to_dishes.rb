class AddAttachmentPhotoToDishes < ActiveRecord::Migration[5.1]
  def self.up
    change_table :dishes do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :dishes, :photo
  end
end
