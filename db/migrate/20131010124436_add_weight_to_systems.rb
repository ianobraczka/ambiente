class AddWeightToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :weight, :integer
  end
end
