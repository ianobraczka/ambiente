class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.integer :program_id
      t.string :name
      t.float :price
      t.integer :hh
      t.integer :percentage
      t.float :value
      t.belongs_to :program

      t.timestamps
    end
  end
end
