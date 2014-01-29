class AddWeightToSubsystems < ActiveRecord::Migration
  def change
    add_column :subsystems, :weight, :integer, :default => 0
  end
end
