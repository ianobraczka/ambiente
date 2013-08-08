class SubsubsystemsController < ApplicationController
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
      format.html { redirect_to subsubsubsystems_url }
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
    @subsubsystem = Subsubsystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subsubsystem }
    end
  end

  def create
    @subsubsystem = Subsubsystem.new(params[:subsubsystem])

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
