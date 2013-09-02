class AddQuantityToPlannings < ActiveRecord::Migration
  def change
    add_column :plannings, :quantity, :float
  end
end
