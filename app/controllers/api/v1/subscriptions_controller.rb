class Api::V1::SubscriptionsController < ApplicationController
  # def index
    
  # end

  # def show
    
  # end

  # def new
    
  # end

  def create
    subscription = Subscription.new(subscription_params)
  
    if subscription.save
      render json: SubscriptionSerializer.return_subscription(subscription), status: 201
    else
      render :json => { :errors => 'Invalid Information' }, :status => 409
    end
  end

  # def edit
    
  # end

  def update
    subscription = Subscription.find(params[:id])
    
    updated_subscription = subscription.update(subscription_params)
    if updated_subscription == true
      render json: SubscriptionSerializer.return_subscription(subscription), status: 200
    else
      render :json => { :errors => 'Invalid Information' }, :status => 409
    end
  end

#   def destroy
    
#   end

private
  def subscription_params
    params[:subscription].permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end