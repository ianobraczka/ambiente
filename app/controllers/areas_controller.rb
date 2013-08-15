class AreasController < ApplicationController

  @@enterprise_id = 1

  def index
    @areas = Area.all
    for area in @areas
      area.price = 0
      for subarea in area.subareas
        area.price = area.price + subarea.price
      end
      for system in area.systems
        area.price = area.price + system.price
      end
    end
  end

  def show
    @area = Area.find(params[:id])
    @area.price = 0
    for subarea in @area.subareas
      @area.price = @area.price + subarea.price
    end
    for system in @area.systems
      @area.price = @area.price + system.price
    end
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
        format.html { redirect_to @area, notice: 'Area atualizada!' }
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
    @area.price = 0

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
end