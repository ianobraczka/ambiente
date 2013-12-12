class AddWeightToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :weight, :integer
  end
end
