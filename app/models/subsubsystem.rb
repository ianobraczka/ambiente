class Subsubsystem < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :subsystem_id, :total_quantity, :unity, :value
  belongs_to :subsystem
  has_many :plannings, as: :plannable

  def total_quantity
    tq = 0
    self.plannings.each do |planning| 
      tq = tq + planning.quantity
    end
    tq
  end

  def accomplished_quantity
    aq = 0
    self.plannings.each do |planning| 
      aq = aq + planning.quantity
    end
    aq
  end

  def quantity_percentage
    if self.total_quantity == nil || self.accomplished_quantity == nil then
      qp = 0
    else
      qp = ((self.accomplished_quantity/self.total_quantity)*100).round
    end
    qp
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

  def completed
    ((accomplished_quantity/total_quantity)*100).round
  end


end
