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
            titles: user_bookplace_list(place.id).join(" "),
            total: user_bookplace_list(place.id).length,
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

  def user_bookplace_list(id)
    @user.books.joins(:places).where('places.id = ?', id).select("title", "id").map { |b| '<li><a href="/books/' +b.id.to_s + '">' + b.title.titleize + '</a></li>' }
  end
end