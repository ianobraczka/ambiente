class Period < ActiveRecord::Base
  attr_accessible :begin_date, :end_date, :planning_id, :quantity, :planned_quantity
  belongs_to :planning
end
