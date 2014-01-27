class AddCurrentPlanningIdToSubsubsystems < ActiveRecord::Migration
  def change
    add_column :subsubsystems, :current_planning_id, :integer
  end
end
