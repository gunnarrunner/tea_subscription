require 'rails_helper'

RSpec.describe "Subscriptions API", type: :request do

  describe 'POST /subscriptions' do
    it 'can create a new subscription' do
      @customer = create(:customer)
      @tea = create(:tea)

      subscribe = {
                    title: 'The Tea',
                    price: 0.69,
                    status: 1,
                    frequency: "I crave Tea",
                    customer_id: @customer.id,
                    tea_id: @tea.id
                  }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      post '/api/v1/subscriptions', headers: headers, params: subscribe, as: :json
      
      expect(response.status).to eq(201)
      
      confirmation = JSON.parse(response.body, symbolize_names: true)

      expect(confirmation.class).to eq(Hash)
      expect(confirmation[:data].class).to eq(Hash)
      expect(confirmation[:data]).to have_key(:id)
      expect(confirmation[:data][:details][:status]).to eq('subscribed')
    end
  end

  describe 'PATCH /subscriptions' do
    it 'can update a subscription subscription' do
      @customer = create(:customer)
      @tea = create(:tea)
      @subscription = create(:subscription, status:0, customer: @customer, tea: @tea)

      update_subscribe = {
                    status: 1
                  }
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
                      
      patch "/api/v1/subscriptions/#{@subscription.id}", headers: headers, params: update_subscribe, as: :json
      
      expect(response.status).to eq(200)
      
      confirmation = JSON.parse(response.body, symbolize_names: true)
      
      expect(confirmation.class).to eq(Hash)
      expect(confirmation[:data].class).to eq(Hash)
      expect(confirmation[:data]).to have_key(:id)
      expect(confirmation[:data][:details][:status]).to eq('subscribed')
    end
  end
end