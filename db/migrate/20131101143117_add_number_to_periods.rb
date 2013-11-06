class AddNumberToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :number, :integer
  end
end
