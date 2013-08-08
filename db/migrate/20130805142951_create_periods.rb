class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :subsubsystem_id
      t.integer :subsystem_id
      t.integer :system_id
      t.integer :number
      t.float :quantity
      t.string :unity
      t.datetime :init_date
      t.datetime :end_date
      t.belongs_to :system
      t.belongs_to :subsystem
      t.belongs_to :subsubsystem

      t.timestamps
    end
  end
end
