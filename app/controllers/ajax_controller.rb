class AjaxController < ApplicationController
	def subsub_data
		model = Subsubsystem.find(params[:id])

		data1 = []
		data2 = []
		data3 = []
		data4 = []
		replanned = []

		total_real = 0
		total_prev = 0
		
		i = 0
		
		model.current_planning.periods.each do |period|
			i += 1
			data1 << {"label" => i.to_s, "y" => period.value_planned, "x" => i * 5}
			total_prev += period.value_planned

			if period.value_real
				data2 << {"label" => i.to_s, "y" => period.value_real, "x" => i * 5}
				total_real += period.value_real
			else
				data2 << {"label" => i.to_s, "y" => 0, "x" => i * 5}
			end
			data3 << {"label" => i.to_s, "y" => total_real, "x" => i * 5}
			data4 << {"label" => i.to_s, "y" => total_prev, "x" => i * 5}

			if period.replanned
				replanned << "1"
			else
				replanned << "0"
			end
		end

		render :json => [data1, data2, data3, data4, replanned].as_json 
	end
end
