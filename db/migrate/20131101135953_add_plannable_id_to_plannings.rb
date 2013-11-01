class AddPlannableIdToPlannings < ActiveRecord::Migration
  def change
    add_column :plannings, :plannable_id, :integer
  end
end
