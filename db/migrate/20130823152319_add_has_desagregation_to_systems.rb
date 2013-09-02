class AddHasDesagregationToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :has_desagragations, :boolean
  end
end
