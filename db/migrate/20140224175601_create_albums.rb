class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :model_origin
      t.integer :model_id

      t.timestamps
    end
  end
end
