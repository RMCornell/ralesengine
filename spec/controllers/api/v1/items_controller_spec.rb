require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  context '#index' do
    it 'returns all the items' do
      merchant = Merchant.new(name: 'Merchant')
      merchant.save
      item = Item.new(name: "Item", description: 'Description', unit_price: 100, merchant_id: merchant.id)
      item.save
      get :index, format: :json

      expect(response).to have_http_status(:ok)

      items = JSON.parse(response.body, symbolize_names: true)
      expect(items.count).to eq(1)

      new_item = items.first
      expect(new_item[:name]).to eq('Item')
      expect(new_item[:description]).to eq('Description')
      # expect(new_item['unit_price']).to eq("100.0")
    end
  end

  context '#show' do
    it 'shows an item' do
      merchant = Merchant.new(name: 'Merchant')
      merchant.save
      item = Item.new(name: "Item", description: 'Description', unit_price: 100, merchant_id: merchant.id)
      item.save

      get :show, id: item.id, :format => :json

      expect(response).to have_http_status(:ok)

      item_response = JSON.parse(response.body, symbolize_names: true)
      expect(item_response[:name]).to eq('Item')
      expect(item_response[:description]).to eq('Description')
      # expect(item_response['unit_price']).to eq("100.0")
    end
  end
end
