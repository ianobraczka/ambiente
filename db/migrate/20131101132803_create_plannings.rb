class CreatePlannings < ActiveRecord::Migration
  def change
    create_table :plannings do |t|
      t.integer :system_id
      t.integer :subsystem_id
      t.integer :subsubsystem_id
      t.date :period_begin
      t.date :period_end
      t.float :quantity
      t.float :planned_quantity

      t.timestamps
    end
  end
end
