class Planning < ActiveRecord::Base
  attr_accessible :subsubsystem_id, :subsystem_id, :system_id, :periods_attributes, :period
  belongs_to :plannable, polymorphic: true
  has_many :periods, :dependent => :destroy
  accepts_nested_attributes_for :periods
end
