class Period < ActiveRecord::Base
  attr_accessible :begin_date, :end_date, :planned_quantity, :planning_id, :quantity
  belongs_to :planning

  def real_quantity
  	self.quantity == nil ? 0 : quantity
  end

  def number
    number = 1
    self.planning.periods.each do |period|
      if period == self then
       return number
     end
     number = number + 1
   end
 end

 def begin_date
  if self.planning.periods.first == self
    date = self.planning.input_date
    while date.wday != 1 do
      date = date + 1.day
    end
    date
  else
    index = 1
    while index < self.planning.periods.count
      if self.planning.periods[index] == self
        return self.planning.periods[index-1].end_date
      end
      index = index +1
    end
  end
end

def completed
  (real_quantity/planned_quantity)*100
end

def end_date
 begin_date + 7.days
end

def real_until_period
  quant = 0
  self.planning.periods.each do |period|
    if self == period
      quant = quant + self.real_quantity
      return quant
    end
    quant = quant + period.real_quantity
  end
end

def planned_until_period
  quant = 0
  self.planning.periods.each do |period|
    if self == period
      quant = quant + self.planned_quantity
      return quant
    end
    quant = quant + period.planned_quantity
  end
end


end
