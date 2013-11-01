class AddPlannedQuantityToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :planned_quantity, :float
  end
end
