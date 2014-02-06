class AddAttachmentImageToEnterprises < ActiveRecord::Migration
  def self.up
    change_table :enterprises do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :enterprises, :image
  end
end
