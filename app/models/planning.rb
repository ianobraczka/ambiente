class Planning < ActiveRecord::Base
  attr_accessible :subsubsystem_id, :subsystem_id, :system_id, :quantity, :period_begin, :period_end
  belongs_to :system
  belongs_to :subsystem
  belongs_to :subsubsystem
end
