class PlanningsController < ApplicationController

	@@plannable_id = 1
	@@plannable_type = " "
	@@past_periods_array = Array.new

	def index
		@plannings = Planning.all
	end

	def show
		@planning = Planning.find(params[:id])
		@plannable = find_plannable
	end

	def edit
		@planning = Planning.find(params[:id])
		@plannable = @planning.plannable
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
				
				params[:planning]["periods_attributes"].each do |item|
					if item[1]["planned_quantity"].to_s == ""
						Period.find(item[1]["id"].to_i).delete
					end
				end

				if @planning.periods.length == 0
					@planning.delete
				end

				format.html { redirect_to @planning.plannable, notice: 'Planejamento atualizado!' }
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

		@@past_periods_array.clear

		unless @plannable.plannings.length == 1 && @plannable.plannings.first == @planning
			if @plannable.current_planning
				@plannable.current_planning.periods.each do |period|
					if period.quantity != nil
						@@past_periods_array.push(period)
					end
				end
			end
		end      
		6.times { @planning.periods.build }

		respond_to do |format|
			format.html
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

		@planning.input_date = Date.current
		respond_to do |format|
			if @planning.save
				format.html { redirect_to @plannable }
				format.json { render json: @planning, status: :created, location: @plannable }
			else
				format.html { render action: "new" }
				format.json { render json: @planning.errors, status: :unprocessable_entity }
			end
		end

		@plannable.current_planning_id = @planning.id
		@plannable.save


		@period_ = @planning.periods.first
		@period_.replanned = true
		@period_.save

		@planning.periods.first.replanned = true
		@planning.periods.first.save!

		@planning.periods = @@past_periods_array + @planning.periods
		@planning.save

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