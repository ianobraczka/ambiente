class System < ActiveRecord::Base
  attr_accessible :enterprise_id, :current_planning_id, :hh, :name, :percentage, :price, :total_quantity, :unity, :value, :area_id, :weight, :image
  has_attached_file :image
  belongs_to :area
  has_many :subsystems, :dependent => :destroy
  has_many :plannings, as: :plannable 


  def financeiro
    v = 0
    v2 = 0
    subsystems.each do |subsub|
      data = subsub.financeiro
      v += data["value_planned"]
      v2 += data["value_real"]
    end

    r = Hash.new

    r["value_planned"] = v
    r["value_real"] = v2

    r
  end

  def avanco_fisico_ponderado

    base = [[0 ,0 , 0],[0 ,0 , 0],[0 ,0 , 0],[0 ,0 , 0]]
    subsystems.each do |sub|
      data =  sub.avanco_fisico_ponderado

      for i in 0..data.length - 1
        for j in 0..data[i].length - 1
          base[i][j] += data[i][j]
        end
      end

    end

    base
  end

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
    self.subsystems.empty? ? self.attributes["price"] : self.subsystems.map(&:price).sum
  end

  def hh
    self.subsystems.empty? ? self.attributes["hh"] : self.subsystems.map(&:hh).sum
  end

  def percentage
    self.subsystems.empty? ? self.attributes["percentage"] : self.subsystems.map(&:percentage).sum
  end

  def value
    self.subsystems.empty? ? self.attributes["value"] : self.subsystems.map(&:value).sum
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
      return (completed/mult).round
    end
  end

  def chosen
    if self.weight == 0 then
      mult = self.value
    elsif self.weight == 2 then
      mult = self.hh
    elsif self.weight == 1 then
      mult = self.percentage
    end
  end

  def weight_variable (weight)
    if weight == 0 then
      mult = self.value
    elsif weight == 2 or weight == 3 then
      mult = self.hh
    elsif weight == 1 then
      mult = self.percentage
    end
  end

  def mult
    if weight == 0 then
      mult = self.value
    elsif weight == 2 or weight == 3 then
      mult = self.hh
    elsif weight == 1 then
      mult = self.percentage
    end
    mult
  end



end