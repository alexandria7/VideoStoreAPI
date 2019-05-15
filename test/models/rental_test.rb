require "test_helper"

describe Rental do
  let(:rental) { rentals(:one) }

  it "must be valid" do
    expect(rental.valid?).must_equal true
  end
end
