class SubsystemsController < ApplicationController
  @@system_id = 1

  def index
    @subsystems = Subsystem.all
  end

  def show
    @subsystem = Subsystem.find(params[:id])
  end

  def edit
    @subsystem = Subsystem.find(params[:id])
  end

  def destroy
    @subsystem = Subsystem.find(params[:id])
    @subsystem.destroy

    respond_to do |format|
      format.html { redirect_to @subsystem.system }
      format.json { head :no_content }
    end
  end

  def update
    @subsystem = Subsystem.find(params[:id])

    respond_to do |format|
      if @subsystem.update_attributes(params[:subsystem])
        format.html { redirect_to @subsystem, notice: 'Subsistema atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @subsystem.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @system = System.find(params[:system_id])
    @subsystem = @system.subsystems.build
    @@system_id = @system.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subsystem }
    end
  end

  def create
    @system = System.find(@@system_id)
    @subsystem = @system.subsystems.build(params[:subsystem])
    @subsystem.price = 0
    @subsystem.hh = 0
    @subsystem.percentage = 0
    @subsystem.value = 0
    @subsystem.weight = @system.weight

    respond_to do |format|
      if @subsystem.save
        format.html { redirect_to @subsystem, notice: ' O Subsistema foi criado com sucesso! ' }
        format.json { render json: @subsystem, status: :created, location: @subsystem }
      else
        format.html { render action: "new" }
        format.json { render json: @subsystem.errors, status: :unprocessable_entity }
      end
    end
  end

  def report
    @subsystem = Subsystem.find(params[:subsystem_id])
    @subsubsystems = Array.new
    @subsystem.subsubsystems.each do |subsubsystem|
      @subsubsystems.push(subsubsystem)
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
