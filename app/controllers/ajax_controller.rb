class AjaxController < ApplicationController
	def subsub_data
		model = Subsubsystem.find(params[:id])

		dataP = []
		dataR = []
		somaDataP = []
		somaDataR = []

		replanned = []

		total_real = 0
		total_prev = 0

		pos = -1

		if model.current_planning
			model.current_planning.periods.each do |period|
				
				pos += 1

				if period.replanned
					replanned << pos
				end

				total_prev += period.value_planned

				total_real += period.value_real if period.value_real

				unless period.replanned
					dataP << {"label" => "Planejado", "y" => period.value_planned}
					dataR << {"label" => "Real", "y" => period.value_real}
					somaDataP << {"label" => "Total Planejado", "y" => total_prev}
					somaDataR << {"label" => "Total Real", "y" => total_real}
				else
					dataP << {"label" => "Planejado", "y" => period.value_planned}
					dataR << {"label" => "Real", "y" => period.value_real}
					somaDataP << {"label" => "Total Planejado", "y" => total_prev}
					somaDataR << {"label" => "Total Real", "y" => total_real, "indexLabel" => "Replanejado"}
				end
			end
		end

		data = [dataP, dataR, somaDataP, somaDataR]

		render :json => [data, replanned].as_json 
	end

	def subsub_data_finance
		model = Subsubsystem.find(params[:id])

		dataP = []
		dataR = []
		somaDataP = []
		somaDataR = []

		replanned = []

		total_real = 0
		total_prev = 0

		pos = -1

		if model.current_planning
			model.current_planning.periods.each do |period|
				
				pos += 1

				if period.replanned
					replanned << pos
				end

				total_prev += period.planned_quantity

				total_real += period.quantity if period.quantity

				unless period.replanned
					dataP << {"label" => "Planejado", "y" => period.planned_quantity}
					dataR << {"label" => "Real", "y" => period.quantity}
					somaDataP << {"label" => "Total Planejado", "y" => total_prev}
					somaDataR << {"label" => "Total Real", "y" => total_real}
				else
					dataP << {"label" => "Planejado", "y" => period.planned_quantity}
					dataR << {"label" => "Real", "y" => period.quantity}
					somaDataP << {"label" => "Total Planejado", "y" => total_prev}
					somaDataR << {"label" => "Total Real", "y" => total_real, "indexLabel" => "Replanejado"}
				end
			end
		end

		data = [dataP, dataR, somaDataP, somaDataR]

		render :json => [data, replanned].as_json 
	end
end
