class AddWeightToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :weight, :integer, :default => 0
  end
end
