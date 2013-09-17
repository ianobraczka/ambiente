class Program < ActiveRecord::Base
  attr_accessible :name, :price, :value, :hh, :percentage
  has_many :enterprises, :dependent => :destroy

  def price
  	value = 0
  	self.enterprises.each do |enterprise|
  		value = value + enterprise.price
  	end
  	value
  end

  def hh
  	value = 0
  	self.enterprises.each do |enterprise|
  		value = value + enterprise.hh
  	end
  	value
  end

  def percentage
  	value = 0
  	self.enterprises.each do |enterprise|
  		value = value + enterprise.percentage
  	end
  	value
  end

  def value
  	value = 0
  	self.enterprises.each do |enterprise|
  		value = value + enterprise.value
  	end
  	value
  end

  def completed
    if !self.enterprises.empty? then
      perc = 0
      self.enterprises.each do |enterprise|
        perc = perc + enterprise.completed
      end
      perc = perc/(self.enterprises.count)
    else
      perc = 0
    end
  end
  
end
