class Enterprise < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :program_id, :value
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
        perc = perc + system.completed
      end
      perc = perc/(self.systems.count)
      perc
    else
      perc = 0
    end
  end

end
