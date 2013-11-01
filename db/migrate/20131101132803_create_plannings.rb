class CreatePlannings < ActiveRecord::Migration
  def change
    create_table :plannings do |t|
      t.integer :system_id
      t.integer :subsystem_id
      t.integer :subsubsystem_id

      t.timestamps
    end
  end
end
