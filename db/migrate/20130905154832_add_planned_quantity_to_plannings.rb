class AddPlannedQuantityToPlannings < ActiveRecord::Migration
  def change
    add_column :plannings, :planned_quantity, :float
  end
end
