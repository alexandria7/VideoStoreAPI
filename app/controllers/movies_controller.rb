class MoviesController < ApplicationController
  def index
    movies = Movie.all

    render json: movies.as_json(only: [:id, :title, :release_date]), status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie
      render json: movie.as_json(only: [:title, :overview, :release_date, :inventory], methods: [:available_inventory]), status: :ok
    else
      render json: { ok: false, error_message: "Movie not found." }, status: :not_found
    end
  end

  def create
    movie = Movie.new(movie_params)

    if movie.save
      render json: movie.as_json(only: [:id, :title, :overview, :release_date, :inventory]), status: :ok
    else
      render json: { ok: false, errors: movie.errors.messages },
        status: :bad_request
    end
  end

  def check_out
    rental = Rental.new(rental_params)
    rental.check_out = Date.today
    rental.due_date = rental.check_out + 7.days

    rental.movie.inventory -= 1

    if rental.save
      render json: rental.as_json(only: [:id, :customer_id, :movie_id, :check_out, :due_date]), status: :ok
    else
      render json: { ok: false, errors: rental.errors.messages }, status: :bad_request
    end
  end

  def check_in
  end

  # def zomg
  #   render json: {message: "it works!"}
  # end

  private

  def movie_params
    params.permit(:title, :overview, :release_date, :inventory)
  end

  def rental_params
    params.permit(:customer_id, :movie_id)
  end
end
