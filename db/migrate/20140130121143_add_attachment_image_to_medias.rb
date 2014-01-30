class AddAttachmentImageToMedias < ActiveRecord::Migration
  def self.up
    change_table :medias do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :medias, :image
  end
end
