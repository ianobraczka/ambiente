class AddInputDateToPlanning < ActiveRecord::Migration
  def change
    add_column :plannings, :input_date, :date
  end
end
