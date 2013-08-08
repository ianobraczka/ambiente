class CreateSubsystems < ActiveRecord::Migration
  def change
    create_table :subsystems do |t|
      t.integer :system_id
      t.string :name
      t.float :price
      t.float :total_quantity
      t.string :unity
      t.integer :hh
      t.integer :percentage
      t.float :value
      t.belongs_to :system

      t.timestamps
    end
  end
end
