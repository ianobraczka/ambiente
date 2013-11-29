class Subsubsystem < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :subsystem_id, :total_quantity, :unity, :value, :weight
  belongs_to :subsystem
  has_many :plannings, :as => :plannable

  def real_quantity
    if !self.plannings.empty?
      self.plannings.map(&:real_quantity).sum
    else
      0
    end
  end

  def completed
    if self.real_quantity == nil then
      qp = 0
    elsif self.planned_quantity != 0 then
      qp = ((self.real_quantity/self.planned_quantity)*100)
    elsif self.planned_quantity == 0 then
      qp = 0
    end
    qp.round
  end

  def planned_quantity
    pq = 0
    self.plannings.each do |planning|
      pq = pq + planning.planned_quantity
    end
    pq
  end

  def current_planning
    self.plannings.last
  end

  def current_period
    current_planning.current_period
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
