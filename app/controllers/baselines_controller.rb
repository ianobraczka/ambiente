class BaselinesControllerController < ApplicationController
  def index
    @baselines = Baseline.all
  end

  def show
    @baseline = Baseline.find(params[:id])
  end

  def edit
    @baseline = Baseline.find(params[:id])
  end

  def destroy
    @baseline = Baseline.find(params[:id])
    @baseline.destroy

    respond_to do |format|
      format.html { redirect_to 'programs'}
      format.json { head :no_content }
    end
  end

  def update
    @baseline = Baseline.find(params[:id])

    respond_to do |format|
      if @baseline.update_attributes(params[:baseline])
        format.html { redirect_to @baseline }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @baseline.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @baseline = Baseline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @baseline }
    end
  end

  def create
    @baseline = Baseline.new(params[:baseline])
    @baseline.weight = 1
    respond_to do |format|
      if @baseline.save
        format.html { redirect_to @baseline}
        format.json { render json: @baseline, status: :created, location: @baseline }
      else
        format.html { render action: "new" }
        format.json { render json: @baseline.errors, status: :unprocessable_entity }
      end
    end
  end

end
