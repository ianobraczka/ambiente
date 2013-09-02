class AddPeriodBeginToPlannings < ActiveRecord::Migration
  def change
    add_column :plannings, :period_begin, :date
  end
end
