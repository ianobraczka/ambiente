class CreateMedias < ActiveRecord::Migration
  def change
    create_table :medias do |t|
      t.integer :level
      t.integer :id_level

      t.timestamps
    end
  end
end
