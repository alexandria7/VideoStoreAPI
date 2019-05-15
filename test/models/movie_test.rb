require "test_helper"

describe Movie do
  let(:movie) { movies(:one) }

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
end
