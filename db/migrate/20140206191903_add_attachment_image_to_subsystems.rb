class AddAttachmentImageToSubsystems < ActiveRecord::Migration
  def self.up
    change_table :subsystems do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :subsystems, :image
  end
end
