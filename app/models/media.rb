class Media < ActiveRecord::Base

	belongs_to :mediable, :polymorphic => true

	attr_accessible :mediable_id, :mediable_type
end
