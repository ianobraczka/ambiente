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

		data = [dataP, dataR, somaDataP, somaDataR]

		#binding.pry

		render :json => [data, replanned].as_json 

		# data = []
		# data1 = []
		# data2 = []
		# data3 = []
		# data4 = []
		# replanned = []

		# total_real = 0
		# total_prev = 0
		
		# i = 0
		
		# model.current_planning.periods.each do |period|

		# 	if period.replanned
		# 		replanned << "1"

		# 		data1 = []
		# 		data2 = []
		# 		data3 = []
		# 		data4 = []

		# 	else
		# 		replanned << "0"
		# 	end

		# 	i += 1

		# 	data1 << {"label" => i.to_s, "y" => period.value_planned}

		# 	total_prev += period.value_planned

		# 	if period.value_real
		# 		data2 << {"label" => i.to_s, "y" => period.value_real}
		# 		total_real += period.value_real
		# 	else
		# 		data2 << {"label" => i.to_s, "y" => 0}
		# 	end

		# 	data3 << {"label" => i.to_s, "y" => total_real}
		# 	data4 << {"label" => i.to_s, "y" => total_prev}

		# 	data << data1
		# 	data << data2
		# 	data << data3
		# 	data << data4	
		# end

		# data << data1
		# data << data2
		# data << data3
		# data << data4

		# binding.pry
		# render :json => [data, replanned].as_json 
	end
end
