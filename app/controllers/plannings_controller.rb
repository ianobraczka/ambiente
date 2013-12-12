class PlanningsController < ApplicationController

  @@plannable_id = 1
  @@plannable_type = " "

  def index
    @plannings = Planning.all
  end

  def show
    @planning = Planning.find(params[:id])
    @plannable = find_plannable
  end

  def edit
    @planning = Planning.find(params[:id])
  end

  def destroy
    @planning = Planning.find(params[:id])
    @planning.destroy

    respond_to do |format|
      format.html { redirect_to plannings_url }
      format.json { head :no_content }
    end
  end

  def update
    @planning = Planning.find(params[:id])

    respond_to do |format|
      if @planning.update_attributes(params[:planning])
        format.html { redirect_to @planning, notice: 'Planejamento atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @planning.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @plannable = find_plannable
    @planning = @plannable.plannings.build
    @@plannable_id = @plannable.id
    @@plannable_type = @plannable.class.to_s
    8.times { @planning.periods.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planning }
    end
  end

  def create
    if @@plannable_type == "Subsubsystem"
      @plannable = Subsubsystem.find(@@plannable_id)
    elsif @@plannable_type == "Subsystem"
      @plannable = Subsystem.find(@@plannable_id)
    elsif @@plannable_type == "System"
      @plannable = System.find(@@plannable_id)
    end
    @planning = @plannable.plannings.build(params[:planning])
    respond_to do |format|
      if @planning.save
        format.html { redirect_to @plannable }
        format.json { render json: @planning, status: :created, location: @plannable }
      else
        format.html { render action: "new" }
        format.json { render json: @planning.errors, status: :unprocessable_entity }
      end
    end
  end

  def find_plannable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end