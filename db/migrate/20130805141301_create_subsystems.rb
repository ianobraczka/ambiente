class CreateSubsystems < ActiveRecord::Migration
  def change
    create_table :subsystems do |t|
      t.integer :system_id
      t.string :name
      t.float :price, :default => 0
      t.float :total_quantity
      t.string :unity
      t.integer :hh, :default => 0
      t.integer :percentage, :default => 0
      t.float :value, :default => 0
      t.belongs_to :system

      t.timestamps
    end
  end
end
