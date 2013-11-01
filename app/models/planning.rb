class Planning < ActiveRecord::Base
  attr_accessible :subsubsystem_id, :subsystem_id, :system_id, :plannable_type, :plannable_id
  has_many :periods, :dependent => :destroy
  belongs_to :plannable, polymorphic: true
  accepts_nested_attributes_for :periods, :reject_if => lambda { |a| a[:planned_quantity].blank? }, :allow_destroy => true
end
