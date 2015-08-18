class PlacesController < ApplicationController
  def index
  end

  def show
    @place = Place.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

end
