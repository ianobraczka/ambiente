class AddWeightToSubsystems < ActiveRecord::Migration
  def change
    add_column :subsystems, :weight, :integer
  end
end
