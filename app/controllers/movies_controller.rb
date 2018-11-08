class MoviesController < ApplicationController
  def index
  	render :search
  end

  def search
	@results = SearchMovie.new(params[:movie_name]).perform
  end
end
