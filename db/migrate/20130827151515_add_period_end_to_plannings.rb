class AddPeriodEndToPlannings < ActiveRecord::Migration
  def change
    add_column :plannings, :period_end, :date
  end
end
