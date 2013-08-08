class SystemsController < ApplicationController
  def index
    @systems = System.all
  end

  def show
    @system = System.find(params[:id])
  end

  def edit
    @system = System.find(params[:id])
  end

  def destroy
    @system = System.find(params[:id])
    @system.destroy

    respond_to do |format|
      format.html { redirect_to systems_url }
      format.json { head :no_content }
    end
  end

  def update
    @system = System.find(params[:id])

    respond_to do |format|
      if @system.update_attributes(params[:system])
        format.html { redirect_to @system, notice: 'Sistema atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @system = System.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @system }
    end
  end

  def create
    @system = System.new(params[:system])

    respond_to do |format|
      if @system.save
        format.html { redirect_to @system, notice: ' O Sistema foi criado com sucesso! ' }
        format.json { render json: @system, status: :created, location: @system }
      else
        format.html { render action: "new" }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end
end
