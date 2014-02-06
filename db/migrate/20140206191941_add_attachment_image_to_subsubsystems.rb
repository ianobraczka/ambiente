class AddAttachmentImageToSubsubsystems < ActiveRecord::Migration
  def self.up
    change_table :subsubsystems do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :subsubsystems, :image
  end
end
