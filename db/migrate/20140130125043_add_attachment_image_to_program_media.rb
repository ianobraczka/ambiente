class AddAttachmentImageToProgramMedia < ActiveRecord::Migration
  def self.up
    change_table :program_media do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :program_media, :image
  end
end
