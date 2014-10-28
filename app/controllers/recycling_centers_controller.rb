class RecyclingCentersController < ApplicationController
  def index
    @recycling_centers = RecyclingCenter.first(75)
  end

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

  def edit
    @recycling_center = RecyclingCenter.find(params[:id])
  end

  def update
    @recycling_center = RecyclingCenter.find(params[:id])
    if @recycling_center.update(recycling_center_params)
      redirect_to recycling_center_path(@recycling_center)
    else
      render 'edit'
    end
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
