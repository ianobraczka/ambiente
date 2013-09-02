class Subsubsystem < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :subsystem_id, :total_quantity, :unity, :value
  belongs_to :subsystem

   def total_quantity
    tq = 0
    self.plannings.each do |planning| 
      tq = tq + planning.total_quantity
    end
    tq
  end

end
