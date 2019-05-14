require "test_helper"

describe Customer do
  let(:customer) { customers(:one) }

  it "can be created" do
    expect(customer.valid?).must_equal true
  end

  it "requires name, registered_at, address, city, state, postal_code, phone" do
    required_fields = [:name, :registered_at, :address, :city, :state, :postal_code, :phone]

    required_fields.each do |field|
      customer[field] = nil
      expect(customer.valid?).must_equal false
      customer.reload
    end
  end
end
