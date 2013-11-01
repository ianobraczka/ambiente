class Program < ActiveRecord::Base
  attr_accessible :name, :price, :value, :hh, :percentage, :weight
  has_many :enterprises, :dependent => :destroy
  has_one :baseline

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
        perc = perc + enterprise.completed*enterprise.weight_variable(weight)
      end
      perc = perc/(self.chosen).round
    else
      perc = 0
    end
  end

  def chosen
    if self.weight == 1 then
      mult = self.value
    elsif weight == 2 then
      mult = self.hh
    elsif weight == 3 then
      mult = self.percentage
    end
  end

  
end
