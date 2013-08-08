class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :enterprise_id
      t.string :name
      t.float :price
      t.integer :hh
      t.integer :percentage
      t.float :value
      t.belongs_to :enterprise

      t.timestamps
    end
  end
end
