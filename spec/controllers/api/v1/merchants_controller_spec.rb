require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  context '#index' do
    it 'returns all merchants' do
      merchant = Merchant.new(name: 'Merchant')
      merchant.save

      get :index, format: :json

      expect(response).to have_http_status(:ok)

      merchants = JSON.parse(response.body, symbolize_names: true)
      expect(merchants.count).to eq(1)

      new_merchant = merchants.first
      expect(new_merchant[:name]).to eq('Merchant')
    end
  end

  context '#show' do
    it 'returns a merchant' do
      merchant = Merchant.new(name: 'Merchant')
      merchant.save

      get :show, id: merchant.id, format: :json

      expect(response).to have_http_status(:ok)

      merchant_response = JSON.parse(response.body, symbolize_names: true)
      expect(merchant_response[:name]).to eq('Merchant')
    end
  end
end
