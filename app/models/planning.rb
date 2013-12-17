class Planning < ActiveRecord::Base
  attr_accessor :_destroy
  attr_accessible :subsubsystem_id, :subsystem_id, :system_id, :plannable_type, :plannable_id, :input_date, :periods_attributes, :_destroy, :init_date
  has_many :periods, :dependent => :destroy, :order => :id
  belongs_to :plannable, polymorphic: true
  accepts_nested_attributes_for :periods, :reject_if => lambda { |a| a[:planned_quantity].blank? }, :allow_destroy => true

  def planned_quantity
  	value = 0
  	self.periods.each do |period|
  		value = value + period.planned_quantity
  	end
  	value
  end

  def real_quantity
  	qt = 0
  	periods = self.periods
  	periods.each do |period|
  		qt = qt + period.real_quantity
  	end
  	qt
  end

  def days_left
    self.current_period.days_left
  end

  def current_period
    self.periods.each do |period|
       if period.quantity == nil then
        return period
      end
    end
    return self.periods.last
  end

  def status_period
    pperiod = self.periods.first
    self.periods.each do |period|
      if period == self.periods.last
        return period
      else
        if period == current_period
          break
        else
          pperiod = period
        end
      end
    end
    return pperiod
  end

  def quantity_percentage
    (real_quantity/planned_quantity)*100
  end

end
