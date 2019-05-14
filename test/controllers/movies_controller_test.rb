require "test_helper"

describe MoviesController do
  let(:movie) { movies(:one) }
  describe "index" do
    it "should get index" do
      get movies_path
      must_respond_with :success
    end

    it "returns json" do
      get movies_path
      expect(response.header["Content-Type"]).must_include "json"
    end

    it "returns an Array" do
      get movies_path

      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    it "returns all of the movies" do
      get movies_path

      body = JSON.parse(response.body)
      body.length.must_equal Movie.count
    end

    it "returns movies with exactly the required fields" do
      keys = %w(id release_date title)

      get movies_path
      body = JSON.parse(response.body)
      body.each do |movie|
        movie.keys.sort.must_equal keys
      end
    end
  end

  describe "show" do
    it "should get show" do
      get movie_path(movie.id)
      must_respond_with :success
    end

    it "returns 404:not_found for an invalid movie" do
      get movie_path("invalid_id")

      must_respond_with :not_found
    end
  end
  # it "should get create" do
  #   get movies_create_url
  #   value(response).must_be :success?
  # end

end
