class Period < ActiveRecord::Base
  attr_accessible :begin_date, :end_date, :planned_quantity, :planning_id, :quantity
  belongs_to :planning
  
end
