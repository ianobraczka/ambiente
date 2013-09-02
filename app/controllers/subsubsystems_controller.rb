class SubsubsystemsController < ApplicationController
  
  @@subsystem_id = 1

  def index
    @subsubsystems = Subsubsystem.all
  end

  def show
    @subsubsystem = Subsubsystem.find(params[:id])
  end

  def edit
    @subsubsystem = Subsubsystem.find(params[:id])
  end

  def destroy
    @subsubsystem = Subsubsystem.find(params[:id])
    @subsubsystem.destroy

    respond_to do |format|
      format.html { redirect_to subsubsystems_url }
      format.json { head :no_content }
    end
  end

  def update
    @subsubsystem = Subsubsystem.find(params[:id])

    respond_to do |format|
      if @subsubsystem.update_attributes(params[:subsubsystem])
        format.html { redirect_to @subsubsystem, notice: 'Subsubsistema atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @subsubsystem.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @subsystem = Subsystem.find(params[:subsystem_id])
    @subsubsystem = @subsystem.subsubsystems.build
    @@subsystem_id = @subsystem.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subsubsystem }
    end
  end

  def create
    @subsystem = Subsystem.find(@@subsystem_id)
    @subsubsystem = @subsystem.subsubsystems.build(params[:subsubsystem])
    @subsubsystem.price = 0
    @subsubsystem.save

    respond_to do |format|
      if @subsubsystem.save
        format.html { redirect_to @subsubsystem, notice: ' O Subsubsistema foi criado com sucesso! ' }
        format.json { render json: @subsubsystem, status: :created, location: @subsubsystem }
      else
        format.html { render action: "new" }
        format.json { render json: @subsubsystem.errors, status: :unprocessable_entity }
      end
    end
  end
end
