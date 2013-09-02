class Period < ActiveRecord::Base
  attr_accessible :end_date, :init_date, :number, :quantity, :subsubsystem_id, :subsystem_id, :system_id, :unity
  belongs_to :planning
end
