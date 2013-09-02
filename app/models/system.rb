class System < ActiveRecord::Base
  attr_accessible :enterprise_id, :hh, :name, :percentage, :price, :total_quantity, :unity, :value
  has_many :areas
  has_many :subsystems, :dependent => :destroy
  belongs_to :enterprise
  has_many :plannings

  def has_desagregation?
  	if self.subsystems.empty? then
  		return false
  	else
  		return true
    end
  end

  def price
    subsystems = self.subsystems
    if subsystems.empty? 
      self.attributes["price"] 
    else
      self.subsystems.map(&:price).sum
    end
  end

  def hh
    if self.has_desagregation? then
      hh = 0
      self.subsystems.each do |subsystem|
        hh = hh + subsystem.hh
      end
      hh
    end
  end

  def percentage
    if self.has_desagregation? then
      percentage = 0
      self.subsystems.each do |subsystem|
        percentage = percentage + subsystem.percentage
      end
      percentage
    end
  end

  def value
    if self.has_desagregation? then
      value = 0
      self.subsystems.each do |subsystem|
        value = value + subsystem.value
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