class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_programs

  def get_programs
  	@programs = Program.all
  end
  
end
