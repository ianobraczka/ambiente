class AddInitDateToPlannings < ActiveRecord::Migration
  def change
    add_column :plannings, :init_date, :Date
  end
end
