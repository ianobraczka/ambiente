class ProgramsController < ApplicationController
  


  def index
  	@programs = Program.all
  end

  def show
  	@program = Program.find(params[:id])
  end

  def edit
    @program = Program.find(params[:id])
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end

  def update
    @program = Program.find(params[:id])

    respond_to do |format|
      if @program.update_attributes(params[:program])
        format.html { redirect_to @program, notice: 'Programa atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @program = Program.new
    @program_media = ProgramMedia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program }
    end
  end

  def create
    binding.pry
    @program = Program.new(params[:program])
    @program.weight = 1
    respond_to do |format|
      if @program.save
        format.html { redirect_to @program}
        format.json { render json: @program, status: :created, location: @program }
      else
        format.html { render action: "new" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  def report
    @program = Program.find(params[:program_id])
    @subsubsystems = Array.new
    @program.enterprises.each do |enterprise|
      enterprise.areas.each do |area|
        area.systems.each do |system|
          system.subsystems.each do |subsystem|
            subsystem.subsubsystems.each do |subsubsystem|
              @subsubsystems.push(subsubsystem)
            end
          end
        end
      end
    end
    @subsubsystems.each do |subsubsystem1|
      @subsubsystems.each do |subsubsystem2|
        if subsubsystem1 != subsubsystem2
          if subsubsystem1.name == subsubsystem2.name
            subsubsystem1.planned_quantity = subsubsystem1.planned_quantity + subsubsystem2.planned_quantity
            subsubsystem1.real_quantity = subsubsystem1.real_quantity + subsubsystem2.real_quantity
            @subsubsystems.delete(subsubsystem2)
          end
        end
      end
    end
  end
    
end
