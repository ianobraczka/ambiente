class CreateSubsubsystems < ActiveRecord::Migration
  def change
    create_table :subsubsystems do |t|
      t.integer :subsystem_id
      t.string :name
      t.float :price, :default => 0
      t.float :total_quantity
      t.string :unity
      t.integer :hh, :default => 0
      t.integer :percentage, :default => 0
      t.float :value, :default => 0
      t.belongs_to :subsystem

      t.timestamps
    end
  end
end
