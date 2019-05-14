require "test_helper"

describe Movie do
  let(:movie) { movies(:one) }
  let(:customer) { customers(:one) }
  let(:rental) { rentals(:one) }

  it "can be created" do
    expect(movie.valid?).must_equal true
  end

  describe "validations" do
    it "requires title, overview, release_date, and inventory" do
      required_fields = [:title, :overview, :release_date, :inventory]

      required_fields.each do |field|
        movie[field] = nil
        expect(movie.valid?).must_equal false
        movie.reload
      end
    end

    it "accepts a numeric inventory value" do
      movie.inventory = 2
      expect(movie.valid?).must_equal true
    end

    it "does not accept a non-numeric inventory value" do
      movie.inventory = "seven"
      expect(movie.valid?).must_equal false
    end
  end

  describe "relationships" do
    # it "has many rentals" do
    #   rentals = Rental.where(movie_id: movie.id)
    #   rentals.must_respond_to :movie
    #   movie.must_respond_to :rentals

    #   rentals.first.must_be_kind_of Rental
    # end

    # it "has many products through order_items" do
    #   results = OrderItem.where(order_id: order.id)
    #   results.first.must_respond_to :product
    #   results.first.product.must_be_kind_of Product
    # end
  end
end
