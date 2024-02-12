class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show]

  # GET /movies
  def index
    @movies = Movie.filtered(params[:actor_name])

    render 'movies/index'
  end

  # GET /movies/1
  def show; end

  private


  def set_movie
    @movie = Movie.find(params[:id])
  end
end
