class Subsystem < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :system_id, :total_quantity, :unity, :value, :weight
  belongs_to :system
  has_many :subsubsystems, :dependent => :destroy
  has_many :plannings, as: :plannable


  def has_desagregation?
  	if self.subsubsystems.empty? then
  		return false
  	else
  		return true
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

   def price
    subsubsystems = self.subsubsystems
    if subsubsystems.empty? 
      self.attributes["price"] 
    else
      self.subsubsystems.map(&:price).sum
    end
  end

  def hh
    subsubsystems = self.subsubsystems
    if subsubsystems.empty? 
      if self.attributes["hh"] != nil then
        self.attributes["hh"]
      else
        0
      end
    else
      self.subsubsystems.map(&:hh).sum
    end
  end

  def percentage
    subsubsystems = self.subsubsystems
    if subsubsystems.empty? 
      if self.attributes["percentage"] != nil then
        self.attributes["percentage"]
      else
        0
      end
    else
      self.subsubsystems.map(&:percentage).sum
    end
  end

  def value
    subsubsystems = self.subsubsystems
    if subsubsystems.empty? 
       if self.attributes["value"] != nil then
        self.attributes["value"]
      else
        0
      end
    else
      self.subsubsystems.map(&:value).sum
    end
  end

  def accomplished_quantity
    aq = 0
    if self.subsubsystems.empty?
      self.plannings.each do |planning| 
        aq = aq + planning.quantity
      end
    else
      self.subsubsystems.each do |subsubsystem|
        aq = aq + subsubsystem.accomplished_quantity
      end
    end
    aq
  end

  def quantity_percentage
    if self.subsubsystems.empty? then
      if self.total_quantity == nil || self.accomplished_quantity == nil then
        qp = 0
      else
        qp = ((self.accomplished_quantity/self.total_quantity)*100).round
      end
    else
      qp = 0
      self.subsubsystems.each do |subsubsystem|
        qp = qp + subsubsystem.completed*subsubsystem.weight_variable(self.weight)
      end
      qp = (qp/self.mult)
    end
    qp
  end

  def planned_quantity
    pq = 0
    if self.subsubsystems.empty?
      self.plannings.each do |planning| 
        pq = pq + planning.planned_quantity
      end
    else
      self.subsubsystems.each do |subsubsystem|
        pq = pq + subsubsystem.planned_quantity
      end
    end
    pq
  end

  def current_planning
    self.plannings.last
  end

  def completed
    quantity_percentage.round
  end

  def weight_variable (weight)
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
