class CreateSubareas < ActiveRecord::Migration
  def change
    create_table :subareas do |t|
      t.integer :area_id
      t.string :name
      t.float :price
      t.integer :hh
      t.integer :percentage
      t.float :value
      t.belongs_to :area

      t.timestamps
    end
  end
end
