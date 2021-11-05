require 'rails_helper'

RSpec.describe "Customers API", type: :request do

  describe 'GET /customer' do
    it 'can create a new subscription' do
      @customer = create(:customer)
      @tea1 = create(:tea)
      @tea2 = create(:tea)
      @tea3 = create(:tea)
      @subscription1 = create(:subscription, customer: @customer, tea: @tea1)
      @subscription2 = create(:subscription, customer: @customer, tea: @tea2)
      @subscription3 = create(:subscription, customer: @customer, tea: @tea3)
                      
      get "/api/v1/customers/#{@customer.id}"
      
      expect(response.status).to eq(200)
      
      customer = JSON.parse(response.body, symbolize_names: true)
      
      expect(customer.class).to eq(Hash)
      expect(customer[:data][:details]).to have_key(:first_name)
      expect(customer[:data][:details]).to have_key(:last_name)
      expect(customer[:data][:details][:subscriptions].class).to eq(Array)
    end
  end
end