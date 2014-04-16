class RecyclingCentersController < ApplicationController
  def new
    @recycling_center = recycling_center
  end

  def create
    @recycling_center = recycling_center
    if @recycling_center.save
      redirect_to recycling_center_path(@recycling_center)
    else
      render 'new'
    end
  end

  def show
    @recycling_center = RecyclingCenter.find(params[:id])
  end

  private

  def recycling_center_params
    ActionController::Parameters.new(params[:recycling_center] || {})
                                .permit(:name, :street, :aluminum_price)
  end

  def recycling_center
    RecyclingCenter.new(recycling_center_params)
  end
end
