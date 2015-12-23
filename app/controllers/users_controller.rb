class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @title = "#{@user.username}'s Book Map"
    @geojsonuser = Array.new

    @user.places.each do |place|
      @geojsonuser << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [place.longitude, place.latitude]
          },
          properties: {
            id: place.id,
            name: place.name,
            :'marker-color' => '#e74c3c',
            :'marker-symbol' => 'circle',
            :'marker-size' => 'small'
        }
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojsonuser }
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :location)
  end
end