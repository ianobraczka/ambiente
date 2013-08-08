class CreateSubsubsystems < ActiveRecord::Migration
  def change
    create_table :subsubsystems do |t|
      t.integer :subsystem_id
      t.string :name
      t.float :price
      t.float :total_quantity
      t.string :unity
      t.integer :hh
      t.integer :percentage
      t.float :value
      t.belongs_to :subsystem

      t.timestamps
    end
  end
end
