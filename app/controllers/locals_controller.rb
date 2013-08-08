class LocalsController < ApplicationController
  def index
    @locals = Local.all
  end

  def show
    @local = Local.find(params[:id])
  end

  def edit
    @local = Local.find(params[:id])
  end

  def destroy
    @local = Local.find(params[:id])
    @local.destroy

    respond_to do |format|
      format.html { redirect_to locals_url }
      format.json { head :no_content }
    end
  end

  def update
    @local = Local.find(params[:id])

    respond_to do |format|
      if @local.update_attributes(params[:local])
        format.html { redirect_to @local, notice: 'Local atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @local = Local.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @local }
    end
  end

  def create
    @local = Local.new(params[:local])

    respond_to do |format|
      if @local.save
        format.html { redirect_to @local, notice: ' O Local foi criado com sucesso! ' }
        format.json { render json: @local, status: :created, location: @local }
      else
        format.html { render action: "new" }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end
end