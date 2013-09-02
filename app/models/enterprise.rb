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
      value= value + system.hh
    end
    value
  end

  def percentage
    value = 0
    self.systems.each do |system|
      value= value + system.percentage
    end
    value
  end

  def value
    value = 0
    self.systems.each do |system|
      value= value + system.value
    end
    value
  end

end
