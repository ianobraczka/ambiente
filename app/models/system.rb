class System < ActiveRecord::Base
  attr_accessible :enterprise_id, :hh, :name, :percentage, :price, :total_quantity, :unity, :value, :area_ids, :weight
  has_and_belongs_to_many :areas
  has_many :subsystems, :dependent => :destroy
  belongs_to :enterprise
  has_many :plannings, as: :plannable

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

  def accomplished_quantity
    aq = 0
    if self.subsystems.empty?
      self.plannings.each do |planning| 
        aq = aq + planning.quantity
      end
    else
      self.subsystems.each do |subsystem|
        aq = aq + subsystem.accomplished_quantity
      end
    end
    aq
  end

  def quantity_percentage
    if self.subsystems.empty? then
      qp = ((self.accomplished_quantity/self.planned_quantity)*100).round
    else
      qp = 0
      self.subsystems.each do |subsystem|
        qp = qp + subsystem.quantity_percentage*subsystem.mult(weight)
        qp = (qp/self.mult)
      end
    end
    qp
  end

  def planned_quantity
    pq = 0
    if self.subsystems.empty?
      self.plannings.each do |planning| 
        pq = pq + planning.planned_quantity
      end
    else
      self.subsystems.each do |subsystem|
        pq = pq + subsystem.planned_quantity
      end
    end
    pq
  end

  def current_planning
    self.plannings.last
  end

  def completed
    if self.subsystems.empty? then
        if self.planned_quantity == 0
          qp = 0
        else
          qp = ((self.accomplished_quantity/self.planned_quantity)*100).round
        end
    else
      qp = 0
      self.subsystems.each do |subsystem|
        qp = qp + subsystem.completed*subsystem.weight_variable(weight)
      end
      qp = (qp/self.chosen)
    end
    qp.round
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

  def weight_variable (weight)
    if weight == 1 then
      mult = self.value
    elsif weight == 2 then
      mult = self.hh
    elsif weight == 3 then
      mult = self.percentage
    end
  end



end