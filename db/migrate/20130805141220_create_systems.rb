class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.integer :area_id
      t.integer :subarea_id
      t.integer :local_id
      t.string :name
      t.float :price
      t.float :total_quantity
      t.string :unity
      t.integer :hh
      t.integer :percentage
      t.float :value
      t.belongs_to :area
      t.belongs_to :subarea
      t.belongs_to :local

      t.timestamps
    end
  end
end
