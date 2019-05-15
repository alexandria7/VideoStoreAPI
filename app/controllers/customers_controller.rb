class CustomersController < ApplicationController
    def index
        customer = Customer.all  
        render json: customer.as_json(only: [:name, :registered_at, :address, :city, :state, :postal_code, :phone]), status: :ok
    end

    def show
        @customer = Customer.find_by(id: params[:id])
        if @customer.nil?
            render json: { errors: {
                title: ["Customer #{params[:id]} not found"]
            }},
            status: :not_found     
        else
            render json: @customer.as_json(only: [:id, :name, :registered_at, :address, :city, :state, :postal_code, :phone]), status: :ok
                
        end
    end

    def create
        customer = Customer.new(customer_params)
        if customer.save
            render json: { id: customer.id }, status: :ok
        else
            render json: {
                errors: {
                    title: ["could not create '#{customer_params[:name]}' Customer"]
                },
                message: customer.error.messages
            }, status: :bad_request
        end  
    end
    
    private

    def customer_params
        params.permit(:id, :name, :registered_at, :address, :city, :state, :postal_code, :phone)
    end

end
