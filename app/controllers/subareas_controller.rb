class SubareasController < ApplicationController
  @@area_id = 1

  def index
    @subareas = Subarea.all
  end

  def show
    @subarea = Subarea.find(params[:id])
  end

  def edit
    @subarea = Subarea.find(params[:id])
  end

  def destroy
    @subarea = Subarea.find(params[:id])
    @subarea.destroy

    respond_to do |format|
      format.html { redirect_to subareas_url }
      format.json { head :no_content }
    end
  end

  def update
    @subarea = Subarea.find(params[:id])

    respond_to do |format|
      if @subarea.update_attributes(params[:subarea])
        format.html { redirect_to @subarea, notice: 'Subarea atualizada!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @subarea.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @area = Area.find(params[:area_id])
    @subarea = @area.subareas.build
    @@area_id = @area.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subarea }
    end
  end

  def create
    @area = Area.find(@@area_id)
    @subarea = @area.subareas.build(params[:subarea])
    @subarea.price = 0

    respond_to do |format|
      if @subarea.save
        format.html { redirect_to @subarea, notice: ' O Subarea foi criada com sucesso! ' }
        format.json { render json: @subarea, status: :created, location: @subarea }
      else
        format.html { render action: "new" }
        format.json { render json: @subarea.errors, status: :unprocessable_entity }
      end
    end
  end
end