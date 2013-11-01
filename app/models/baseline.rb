class Baseline < ActiveRecord::Base
  attr_accessible :date, :comment
  has_many :plannings
  belongs_to :program

  def real_quantity
  	total_quantity = 0
  	self.plannings.each do |planning|
  		total_quantity = total_quantity + planning.quantity
  	end
  	total_quantity
  end

  def planned_quantity
  	planned_quantity = 0
  	self.plannings.each do |planning|
  		planned_quantity = planned_quantity + planning.planned_quantity
  	end
  	planned_quantity
  end

end
