class CreateBaselines < ActiveRecord::Migration
  def change
    create_table :baselines do |t|

      t.timestamps
    end
  end
end
