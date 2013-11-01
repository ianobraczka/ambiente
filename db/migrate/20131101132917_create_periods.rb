class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :planning_id
      t.float :quantity
      t.float :planned_quantity
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
