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
    it "has associated rentals" do
      expect(movie).must_respond_to :rentals
      expect(movie.rentals).must_include rental
    end

    it "has associated customers through rentals" do
      expect(movie).must_respond_to :customers
      expect(movie.customers).must_include customer
    end
  end
end
