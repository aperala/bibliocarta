class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @title = "#{@user.username}'s Book Map"
    @geojsonuser = Array.new

    @user.books.each do |book|
      @geojsonuser << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [book.places.first.longitude, book.places.first.latitude]
          },
          properties: {
            id: book.places.first.id,
            name: book.places.first.name,
            title: book.title.titleize,
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