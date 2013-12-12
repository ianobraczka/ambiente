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
      format.html { redirect_to @enterprise.program }
      format.json { head :no_content }
    end
  end

  def update
    @enterprise = Enterprise.find(params[:id])

    respond_to do |format|
      if @enterprise.update_attributes(params[:enterprise])
        format.html { redirect_to @enterprise }
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
    @enterprise.weight = @program.weight
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

  def report
    @enterprise = Enterprise.find(params[:enterprise_id])
    @subsubsystems = Array.new
    @enterprise.areas.each do |area|
      area.systems.each do |system|
        system.subsystems.each do |subsystem|
          subsystem.subsubsystems.each do |subsubsystem|
            @subsubsystems.push(subsubsystem)
          end
        end
      end
    end
    @subsubsystems.each do |subsubsystem1|
      @subsubsystems.each do |subsubsystem2|
        if subsubsystem1 != subsubsystem2
          if subsubsystem1.name == subsubsystem2.name
            subsubsystem1.planned_quantity = subsubsystem1.planned_quantity + subsubsystem2.planned_quantity
            subsubsystem1.real_quantity = subsubsystem1.real_quantity + subsubsystem2.real_quantity
            @subsubsystems.delete(subsubsystem2)
          end
        end
      end
    end
  end


end
