class AddWeightToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :weight, :integer
  end
end
