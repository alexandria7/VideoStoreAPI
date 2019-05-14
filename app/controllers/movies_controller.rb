class MoviesController < ApplicationController
  def index
    movies = Movie.all

    render json: movies.as_json(only: [:id, :title, :release_date]), status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie
      render json: movie.as_json(only: [:title, :overview, :release_date, :inventory]), status: :ok
    else
      render json: {ok: false, error_message: "Movie not found."}, status: :not_found
    end
  end

  def create
  end

  def zomg
    render json: {message: "it works!"}
  end
end
