class RecyclingCentersController < ApplicationController
  def new
    @recycling_center = recycling_center
  end

  def create
    @recycling_center = recycling_center
    if @recycling_center.save
      redirect_to recycling_center_path(@recycling_center)
    else
      message = "Recycling Center could not be created."
      message += " Please make sure all required fields are completed."
      flash.now[:alert] = message
      render 'new'
    end
  end

  def show
    @recycling_center = RecyclingCenter.find(params[:id])
  end

  private

  def recycling_center_params
    ActionController::Parameters.new(params[:recycling_center] || {})
      .permit(:name, :street, :city, :state, :zip, :telephone, :hours,
              :aluminum_price, :paper_price, :plastic_price, :glass_price)
  end

  def recycling_center
    RecyclingCenter.new(recycling_center_params)
  end
end
