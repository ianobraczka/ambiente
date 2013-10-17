class Enterprise < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :program_id, :value, :weight
  belongs_to :program
  has_many :systems, :dependent => :destroy

  def price
  	value = 0
  	self.systems.each do |system|
  		value= value + system.price
  	end
  	value
  end

  def hh
    value = 0
    self.systems.each do |system|
      if system.hh != nil then
        value = value + system.hh
      end
    end
    value
  end

  def percentage
    value = 0
    self.systems.each do |system|
      if system.percentage != nil
        value= value + system.percentage
      end
    end
    value
  end

  def value
    value = 0
    self.systems.each do |system|
      if system.value != nil then
        value= value + system.value
      end
    end
    value
  end

  def completed
    if !self.systems.empty? then
      perc = 0
      self.systems.each do |system|
        perc = perc + system.completed*system.weight_variable(self.weight)
      end
      perc = perc/(self.chosen)
      perc.round
    else
      perc = 0
    end
  end

  def chosen
    if self.weight == 1 then
      mult = self.value
    elsif self.weight == 2 then
      mult = self.hh
    elsif self.weight == 3 then
      mult = self.percentage
    end
  end

  def weight_variable (recieved)
    if recieved == 1 then
      mult = self.value
    elsif recieved == 2 then
      mult = self.hh
    elsif recieved == 3 then
      mult = self.percentage
    end
  end

end
