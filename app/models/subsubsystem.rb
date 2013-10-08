class Subsubsystem < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :subsystem_id, :total_quantity, :unity, :value
  belongs_to :subsystem
  has_many :plannings, as: :plannable

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
    elsif self.total_quantity != 0 then
      qp = ((self.accomplished_quantity/self.total_quantity)*100).round
    elsif self.total_quantity == 0 then
      qp = 0
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
  if total_quantity != 0 then
    ((accomplished_quantity/total_quantity)*100).round
  else
    0
  end
  end
end
