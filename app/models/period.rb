class Period < ActiveRecord::Base
  attr_accessible :begin_date, :end_date, :planned_quantity, :planning_id, :quantity
  belongs_to :planning

  def real_quantity
  	if self.quantity == nil
  		self.quantity = 0
  	end
  	quantity
  end

  def number
  number = 1
	self.planning.periods.each do |period|
	  	if period.id == self.id then
	  		return number
	  	end
	  	number = number + 1
	 end
  end

  def days_left
  end

  def begin_date
  	if self != self.planning.periods.first then
	  	variable = 0
	  	self.planning.periods.each do |period|
	  		if period == self then
	  			return variable
	  		end
	  		variable = variable + 1
	  	end
	 	return self.planning.periods.find(variable).end_date
	else
		self.attributes["begin_date"]
	end
  end

  def end_date
  	begin_date + 7.days
  end

  
end
