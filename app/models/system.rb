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
    subsystems = self.subsystems
    if subsystems.empty? 
      self.attributes["hh"] 
    else
      self.subsystems.map(&:hh).sum
    end
  end

  def percentage
    subsystems = self.subsystems
    if subsystems.empty? 
      self.attributes["percentage"] 
    else
      self.subsystems.map(&:percentage).sum
    end
  end

  def value
    subsystems = self.subsystems
    if subsystems.empty? 
      self.attributes["value"] 
    else
      self.subsystems.map(&:value).sum
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