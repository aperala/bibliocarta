class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @title = "Bookmark - World Map"
    @places = Place.all
    @geojson = Array.new

    @places.each do |place|
      if place.books.length >= 1
        @geojson << {
          type: 'Feature',
          geometry:{
            type: 'Point',
            coordinates: [place.longitude, place.latitude]
            },
            properties: {
              id: place.id,
              name: place.name,
              books: place.books.length,
              :'marker-color' => '#29A329',
              :'marker-symbol' => 'library',
              :'marker-size' => 'small'
            }
        }
      end
    end

    respond_to do |format|
      format.html 
      format.json { render json: @geojson }
    end
  end

  def show
    @title = @place.name.titleize
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
    if @place.update(place_params)
      redirect_to @place, notice: "Location has been updated"
    else
      render :edit
    end
  end

  def import
    Place.import(params[:file])
    redirect_to root_path, notice: "Locations imported"
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :region, :latitude, :longitude)
  end 
end
