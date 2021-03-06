class Period < ActiveRecord::Base
  attr_accessible :begin_date, :end_date, :planned_quantity, :planning_id, :quantity, :value_planned, :value_real, :replanned
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
    quant = quant + period.quantity
    if self == period
      return quant
    end
  end
end

def real_until_period_value
  value = 0
  self.planning.periods.each do |period|
    if period.value_real
      value = value + period.value_real
    end
    
    if self == period
      return value
    end
  end

  value
end

def made_until_period
  quant = 0
  expected = 0
  self.planning.periods.each do |period|
    if period.quantity
      quant += period.quantity 
    end
    expected += period.planned_quantity

    if self == period
      break
    end
  end

  (quant)*100
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

def planned_until_period_value
  value  = 0
  self.planning.periods.each do |period|
    if self == period
      value = value + self.value_planned
      return value
    end
    value = value + period.value_planned
  end
end


end
