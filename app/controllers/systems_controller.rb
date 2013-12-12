class SystemsController < ApplicationController
  
  @@area_id = 1

  def index
    @systems = System.all
  end

  def show
    @system = System.find(params[:id])
  end

  def edit
    @system = System.find(params[:id])
  end

  def define
    @system = System.find(params[:id])
  end

  def destroy
    @system = System.find(params[:id])
    @system.destroy

    respond_to do |format|
      format.html { redirect_to @system.area }
      format.json { head :no_content }
    end
  end

  def update
    @system = System.find(params[:id])
    respond_to do |format|
      if @system.update_attributes(params[:system])
        format.html { redirect_to @system }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @area = Area.find(params[:area_id])
    @system = @area.systems.build
    @@area_id = @area.id
    @system.price = 0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @system }
    end
  end

  def create
    @area = Area.find(@@area_id)
    @system = @area.systems.build(params[:system])
    @system.price = 0
    @system.hh = 0
    @system.percentage = 0
    @system.value = 0
    @system.weight = @area.weight
    @system.save
    respond_to do |format|
      if @system.save
        format.html { redirect_to @system }
        format.json { render json: @system, status: :created, location: @system }
      else
        format.html { render action: "new" }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  def report
    @system = System.find(params[:system_id])
    @subsubsystems = Array.new
    @system.subsystems.each do |subsystem|
      subsystem.subsubsystems.each do |subsubsystem|
        @subsubsystems.push(subsubsystem)
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
