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

  def new
    @program = Program.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program }
    end
  end

end
