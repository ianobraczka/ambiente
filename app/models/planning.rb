class Planning < ActiveRecord::Base
  attr_accessible :subsubsystem_id, :subsystem_id, :system_id, :quantity, :period_begin, :period_end, :planned_quantity
  belongs_to :plannable, polymorphic: true

  def period_end
  	pe = period_begin + 7.days
  	pe
  end

  def period_begin
  	pb = created_at.to_date
  	pb
  end

  def quantity_percentage
    qp = (quantity/planned_quantity)*100
    qp.round
  end

  def days_left
    if(period_end > Date.current) then
      dl = (period_end - Date.current).round
    else
      dl = -1
    end
  end

end
