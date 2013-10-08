class CreateSystemsAndAreas < ActiveRecord::Migration
  def change
    create_table :systems_areas do |t|
      t.belongs_to :system
      t.belongs_to :area
    end
  end
end