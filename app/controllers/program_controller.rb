class ProgramController < ApplicationController
  def index
  	@programs = Program.all
  end

  def show
  	@program = Program.find(params[:id])
  end

  def edit
  end

  def delete
  end
end
