class PlacesController < ApplicationController
  def index
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.valid?
      @place.save!
      redirect_to places_path, notice: "Location was successfully added"
    else
      render :new
    end
  end

  def edit

  end

  def update

  end


  private

  def place_params
    params.require(:place).permit(:name, :region, :latitude, :longitude)
  end 
end
