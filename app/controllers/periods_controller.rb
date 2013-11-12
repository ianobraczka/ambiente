class PeriodsController < ApplicationController

	def edit
    	@period = Period.find(params[:id])
  	end

  	def update
    @period = Period.find(params[:id])

    respond_to do |format|
      if @period.update_attributes(params[:period])
        format.html { redirect_to @period.planning.plannable}
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end
end