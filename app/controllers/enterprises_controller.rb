class EnterprisesController < ApplicationController
  def index
    @enterprises = Enterprise.all
  end

  def show
    @enterprise = Enterprise.find(params[:id])
  end

  def edit
    @enterprise = Enterprise.find(params[:id])
  end

  def destroy
    @enterprise = Enterprise.find(params[:id])
    @enterprise.destroy

    respond_to do |format|
      format.html { redirect_to enterprises_url }
      format.json { head :no_content }
    end
  end

  def update
    @enterprise = Enterprise.find(params[:id])

    respond_to do |format|
      if @enterprise.update_attributes(params[:enterprise])
        format.html { redirect_to @enterprise, notice: 'enterprisea atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @enterprise = Enterprise.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enterprise }
    end
  end

  def create
    @enterprise = Enterprise.new(params[:enterprise])

    respond_to do |format|
      if @enterprise.save
        format.html { redirect_to @enterprise, notice: ' O enterprisea foi criado com sucesso! ' }
        format.json { render json: @enterprise, status: :created, location: @enterprise }
      else
        format.html { render action: "new" }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end


end
