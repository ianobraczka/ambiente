class Planning < ActiveRecord::Base
  attr_accessor :_destroy
  attr_accessible :subsubsystem_id, :subsystem_id, :system_id, :plannable_type, :plannable_id, :periods_attributes, :_destroy
  has_many :periods, :dependent => :destroy
  belongs_to :plannable, polymorphic: true
  accepts_nested_attributes_for :periods, :reject_if => lambda { |a| a[:planned_quantity].blank? }, :allow_destroy => true

  def planned_quantity
  	value = 0
  	self.periods.each do |period|
  		value = value + period.planned_quantity
  	end
  	value
  end


end
