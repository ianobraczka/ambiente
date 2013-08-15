class ProgramsController < ApplicationController
  
  def index
  	@programs = Program.all
    for program in @programs
      program.price = 0
      for enterprise in program.enterprises
        program.price = program.price + enterprise.price
      end
    end
  end

  def show
  	@program = Program.find(params[:id])
    @program.price = 0
    @program.enterprises.each do |enterprise|
      @program.price = @program.price + enterprise.price
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end

  def update
    @program = Program.find(params[:id])

    respond_to do |format|
      if @program.update_attributes(params[:program])
        format.html { redirect_to @program, notice: 'Programa atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @program = Program.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program }
    end
  end

  def create
    @program = Program.new(params[:program])

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: ' O programa foi criado com sucesso! ' }
        format.json { render json: @program, status: :created, location: @program }
      else
        format.html { render action: "new" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end


end
