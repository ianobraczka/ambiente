class AreasController < ApplicationController

  @@enterprise_id = 1

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
  end

  def edit
    @area = Area.find(params[:id])
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy

    respond_to do |format|
      format.html { redirect_to areas_url }
      format.json { head :no_content }
    end
  end

  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(params[:area])
        format.html { redirect_to @area, notice: 'area atualizada!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @enterprise = Enterprise.find(params[:enterprise_id])
    @area = @enterprise.areas.build
    @@enterprise_id = @enterprise.id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enterprise }
    end
  end

  def create
    @enterprise = Enterprise.find(@@enterprise_id)
    @area = @enterprise.areas.build(params[:area])
    @area.weight = @enterprise.weight
    respond_to do |format|
      if @area.save
        format.html { redirect_to @area, notice: 'A area foi criada com sucesso! ' }
        format.json { render json: @area, status: :created, location: @area }
      else
        format.html { render action: "new" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def report
    @area = Area.find(params[:area_id])
    @subsubsystems = Array.new
    @area.systems.each do |system|
      system.subsystems.each do |subsystem|
        subsystem.subsubsystems.each do |subsubsystem|
          @subsubsystems.push(subsubsystem)
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