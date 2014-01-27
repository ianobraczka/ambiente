class AddCurrentPlanningIdToSubsystems < ActiveRecord::Migration
  def change
    add_column :subsystems, :current_planning_id, :integer
  end
end
