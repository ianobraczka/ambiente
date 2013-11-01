class PlanningsController < ApplicationController

  @@plannable_id = 1

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
    3.times { @planning.periods.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planning }
    end
  end

  def create
    @plannable = find_plannable
    if @plannable.plannings.empty?
      @planning = @plannable.plannings.build(params[:planning])
      @planning.period_begin = Date.current
    else
      begin_date = @plannable.plannings.last.period_end
      @planning = @plannable.plannings.build(params[:planning])
      @planning.period_begin = begin_date
    end
    respond_to do |format|
      if @planning.save
        format.html { redirect_to new_planning_path(@plannable) }
        format.json { render json: @planning, status: :created, location: @planning.plannable.plannings }
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
