class EnterprisesController < ApplicationController
  @@program_id = 1

  def index
    @enterprises = Enterprise.all
  end

  def show
    @enterprise = Enterprise.find(params[:id])
    @ponderators = ["HH", "Percentagem", "Valor"]
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
    @program = Program.find(params[:program_id])
    @enterprise = @program.enterprises.build
    @@program_id = @program.id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enterprise }
    end
  end

  def create
    @program = Program.find(@@program_id)
    @enterprise = @program.enterprises.build(params[:enterprise])
    respond_to do |format|
      if @enterprise.save
        format.html { redirect_to @enterprise, notice: ' O empreendimento foi criado com sucesso! ' }
        format.json { render json: @enterprise, status: :created, location: @enterprise }
      else
        format.html { render action: "new" }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end


end
