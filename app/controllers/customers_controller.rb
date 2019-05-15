class CustomersController < ApplicationController
  def index
    customer = Customer.all
    render json: customer.as_json(only: [:id, :name, :registered_at, :postal_code, :phone], methods: [:movies_checked_out_count]), status: :ok
  end

  # def show
  #   @customer = Customer.find_by(id: params[:id])
  #   if @customer.nil?
  #     render json: { errors: {
  #              title: ["Customer #{params[:id]} not found"],
  #            } },
  #            status: :not_found
  #   else
  #     render json: @customer.as_json(only: [:id, :name, :registered_at, :postal_code, :phone]), status: :ok
  #   end
  # end


  private

  def customer_params
    params.permit(:id, :name, :registered_at, :postal_code, :phone)
  end
end
