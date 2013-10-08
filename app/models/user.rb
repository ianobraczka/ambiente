class User < ActiveRecord::Base
  attr_accessible :editor, :name, :password
end
