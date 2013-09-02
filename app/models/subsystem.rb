class Subsystem < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :system_id, :total_quantity, :unity, :value
  belongs_to :system
  has_many :subsubsystems, :dependent => :destroy

  def has_desagregation?
  	if self.subsubsystems.empty? then
  		return false
  	else
  		return true
  	end
  end

   def price
    subsubsystems = self.subsubsystems
    if subsubsystems.empty? 
      self.attributes["price"] 
    else
      self.subsubsystems.map(&:price).sum
    end
  end

  def hh
    if self.has_desagregation? then
      value = 0
      self.subsubsystems.each do |subsubsystem|
        value = value + subsubsystem.hh
      end
      value
    end
  end

  def percentage
    if self.has_desagregation? then
      value = 0
      self.subsubsystems.each do |subsubsystem|
        value = value + subsubsystem.percentage
      end
      value
    end
  end

  def value
    if self.has_desagregation? then
      value = 0
      self.subsubsystems.each do |subsubsystem|
        value = value + subsubsystem.value
      end
      value
    end
  end

   def total_quantity
    tq = 0
    self.plannings.each do |planning| 
      tq = tq + planning.total_quantity
    end
    tq
  end


end
