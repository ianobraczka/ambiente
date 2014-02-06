class AddAttachmentImageToSystems < ActiveRecord::Migration
  def self.up
    change_table :systems do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :systems, :image
  end
end
