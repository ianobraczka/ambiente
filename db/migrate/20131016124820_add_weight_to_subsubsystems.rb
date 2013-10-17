class AddWeightToSubsubsystems < ActiveRecord::Migration
  def change
    add_column :subsubsystems, :weight, :integer
  end
end
