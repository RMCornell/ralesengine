require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  context '#index' do
    it 'returns all the customers' do
      Customer.create(first_name: "First", last_name: "Last")

      get :index, format: :json

      expect(response).to have_http_status(:ok)

      customers = JSON.parse(response.body)
      expect(customers.count).to eq(1)

      customer = customers.first
      expect(customer['first_name']).to eq('First')
      expect(customer['last_name']).to eq('Last')
    end
  end

  context '#show' do
    it 'shows a customer' do
      customer = Customer.create(first_name: "First", last_name: "Last")

      get :show, id: customer.id, :format => :json

      expect(response).to have_http_status(:ok)

      customer_response = JSON.parse(response.body)
      expect(customer_response['first_name']).to eq("First")
      expect(customer_response['last_name']).to eq("Last")
    end
  end
end

