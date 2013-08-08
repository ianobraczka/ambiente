class AreasController < ApplicationController
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
        format.html { redirect_to @area, notice: 'Area atualizada!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @area = Area.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @area }
    end
  end

  def create
    @area = Area.new(params[:area])

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