class System < ActiveRecord::Base
  attr_accessible :enterprise_id, :current_planning_id, :hh, :name, :percentage, :price, :total_quantity, :unity, :value, :area_id, :weight
  belongs_to :area
  has_many :subsystems, :dependent => :destroy
  has_many :plannings, as: :plannable

  def has_desagregation?
    not self.subsystems.empty?
  end

  def current_planning
      Planning.find(self.current_planning_id)
  end

  def current_period
    current_planning.current_period
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

  def real_quantity
    rq = 0
    if self.subsystems.empty?
      self.plannings.each do |planning| 
        rq = rq + planning.real_quantity
      end
    else
      self.subsystems.each do |subsystem|
        rq = rq + subsystem.real_quantity
      end
    end
    rq
  end

  def current_planning
    self.plannings.last
  end

  def completed
    if self.planned_quantity == nil || self.real_quantity == nil
      return 0
    elsif self.real_quantity == 0 || self.planned_quantity == 0
      return 0
    else
      completed = 0
      self.subsystems.each do |subsystem|
        unless subsystem.planned_quantity == 0
          completed = completed + (subsystem.real_quantity*100/subsystem.planned_quantity)*subsystem.weight_variable(weight)
        end
      end
      (completed/mult).round
    end
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