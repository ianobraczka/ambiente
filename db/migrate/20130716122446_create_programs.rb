class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.float :price
      t.integer :hh
      t.integer :percentage
      t.float :value

      t.timestamps
    end
  end
end
