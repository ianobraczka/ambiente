class AddValuesToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :value_planned, :float, :default => 0
    add_column :periods, :value_real, :float, :default => 0
  end
end
