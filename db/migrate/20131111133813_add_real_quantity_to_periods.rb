class AddRealQuantityToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :real_quantity, :float
  end
end
