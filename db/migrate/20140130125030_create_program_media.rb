class CreateProgramMedia < ActiveRecord::Migration
  def change
    create_table :program_media do |t|

      t.timestamps
    end
  end
end
