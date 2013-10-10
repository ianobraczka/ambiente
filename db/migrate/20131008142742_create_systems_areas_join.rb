class CreateSystemsAreasJoin < ActiveRecord::Migration
  def up
  	create_table 'areas_systems', :id => false do |t|
    t.column :area_id, :integer
    t.column :system_id, :integer
  	end
  end

  def down
  	drop_table 'areas_systems'
  end
end
