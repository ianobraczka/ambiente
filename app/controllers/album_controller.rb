class AlbumController < ApplicationController
	def view_album

		unless request.post?

			@current_album = Album.where("model_origin = '#{params[:model]}' and model_id =  #{params[:id]}")

			if @current_album
			end

			@album = Album.new

			@model_origin = params[:model]
			@model_id = params[:id]

		else

			album = Album.create(params[:album])

			album.save!
			
			@current_album = Album.where("model_origin = '#{params[:model_origin]}' and model_id =  #{params[:model_id]}")

			@album = Album.new

			redirect_to "/album/view_album?model=#{params[:album][:model_origin]}&id=#{params[:album][:model_id]}"
		end
	end

	def delete_image
		
		Album.find(params[:album_id]).delete

		redirect_to "/album/view_album?model=#{params[:model]}&id=#{params[:id]}"
	end
end
