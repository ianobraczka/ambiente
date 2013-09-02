class PlanningsController < ApplicationController

  def index
    @plannings = Planning.all
  end

  def show
    @planning = Planning.find(params[:id])
  end

  def edit
    @planning = Planning.find(params[:id])
  end

  def destroy
    @planning = Planning.find(params[:id])
    @planning.destroy

    respond_to do |format|
      format.html { redirect_to plannings_url }
      format.json { head :no_content }
    end
  end

  def update
    @planning = Planning.find(params[:id])

    respond_to do |format|
      if @planning.update_attributes(params[:planning])
        format.html { redirect_to @planning, notice: 'Planejamento atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @planning.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @system = System.find(params[:system_id])
    @planning = @system.plannings.build
    @@system_id = @system.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planning }
    end
  end

  def create
    @system = System.find(@@system_id)
    @planning = @enterprise.plannings.build(params[:planning])
    @planning.price = 0
    @planning.save
    respond_to do |format|
      if @planning.save
        format.html { redirect_to @planning, notice: ' O Sistema foi criado com sucesso! ' }
        format.json { render json: @planning, status: :created, location: @planning }
      else
        format.html { render action: "new" }
        format.json { render json: @planning.errors, status: :unprocessable_entity }
      end
    end
  end
end
