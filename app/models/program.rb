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

  def planned_quantity
    pq = 0
    unless self.enterprises.empty?
      self.enterprises.each do |enterprise|
        pq = pq + enterprise.planned_quantity
      end
    end
    pq
  end

  def real_quantity
    rq = 0
    if self.enterprises.empty?
      self.enterprises.each do |enterprise|
        rq = rq + enterprise.real_quantity
      end
    end
    rq
  end

  def completed
    if self.planned_quantity == nil || self.real_quantity == nil
      return 0
    elsif self.real_quantity == 0 || self.planned_quantity == 0
      return 0
    else
      completed = 0
      self.enterprises.each do |enterprise|
        unless enterprise.planned_quantity == 0
          completed = completed + (enterprise.real_quantity*100/enterprise.planned_quantity)*enterprise.weight_variable(weight)
        end
      end
      (completed/mult).round 
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
  
  def mult
    if weight == 1 then
      mult = self.value
    elsif weight == 2 then
      mult = self.hh
    elsif weight == 3 then
      mult = self.percentage
    end
    mult
  end  
end
