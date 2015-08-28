class BookPlacesController < ApplicationController

  def new
    @book_place = BookPlace.new
  end

  def create
    @place = Place.find(params[:book_place][:place_id])
    @book = Book.find(params[:book_place][:book_id])
    @place.books << @book
    redirect_to book_path(@book)
  end

  private

  def book_place_params
    params.require(:book_place).permit(:book_id, :place_id)
  end

end