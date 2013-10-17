class AddWeightToEnterprises < ActiveRecord::Migration
  def change
    add_column :enterprises, :weight, :integer
  end
end
