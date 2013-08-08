class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.integer :subarea_id
      t.string :name
      t.float :price
      t.integer :hh
      t.integer :percentage
      t.float :value
      t.belongs_to :subarea

      t.timestamps
    end
  end
end
