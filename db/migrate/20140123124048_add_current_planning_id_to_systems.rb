class AddCurrentPlanningIdToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :current_planning_id, :integer
  end
end
