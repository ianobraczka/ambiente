class AddPlannableTypeToPlannings < ActiveRecord::Migration
  def change
    add_column :plannings, :plannable_type, :string
  end
end
