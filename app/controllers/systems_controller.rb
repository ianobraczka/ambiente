class SystemsController < ApplicationController
  
  @@enterprise_id = 1

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
      format.html { redirect_to @system.enterprise }
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
    @enterprise = Enterprise.find(params[:enterprise_id])
    @system = @enterprise.systems.build
    @@enterprise_id = @enterprise.id
    @system.price = 0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @system }
    end
  end

  def create
    @enterprise = Enterprise.find(@@enterprise_id)
    @system = @enterprise.systems.build(params[:system])
    @system.price = 0
    @system.hh = 0
    @system.percentage = 0
    @system.value = 0
    @system.weight = @enterprise.weight
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
end
