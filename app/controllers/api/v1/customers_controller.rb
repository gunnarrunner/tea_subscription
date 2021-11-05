class Api::V1::CustomersController < ApplicationController
  # def index
    
  # end

  def show
    customer = Customer.find(params[:id])
    render json: CustomerSerializer.return_customer(customer)
      rescue ActiveRecord::RecordNotFound
    render status: 404
  end

  # def new
    
  # end

  # def create
  
  # end

  # def edit
    
  # end

  # def update
    
  # end

#   def destroy
    
#   end

# private
#   def _params

#   end
end