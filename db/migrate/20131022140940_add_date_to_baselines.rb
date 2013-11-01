class AddDateToBaselines < ActiveRecord::Migration
  def change
    add_column :baselines, :date, :Date
  end
end
