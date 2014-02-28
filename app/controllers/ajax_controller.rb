class AjaxController < ApplicationController
	def subsub_data
		model = Subsubsystem.find(params[:id])

		data = []
		data1 = []
		data2 = []
		data3 = []
		data4 = []
		replanned = []

		total_real = 0
		total_prev = 0
		
		i = 0
		
		model.current_planning.periods.each do |period|

			if period.replanned
				replanned << "1"

				data1 = []
				data2 = []
				data3 = []
				data4 = []

			else
				replanned << "0"
			end
			
			i += 1

			data1 << {"label" => i.to_s, "y" => period.value_planned}
			
			total_prev += period.value_planned

			if period.value_real
				data2 << {"label" => i.to_s, "y" => period.value_real}
				total_real += period.value_real
			else
				data2 << {"label" => i.to_s, "y" => 0}
			end

			data3 << {"label" => i.to_s, "y" => total_real}
			data4 << {"label" => i.to_s, "y" => total_prev}

			data << data1
			data << data2
			data << data3
			data << data4	
		end

		data << data1
		data << data2
		data << data3
		data << data4
		
		render :json => [data, replanned].as_json 
	end
end
