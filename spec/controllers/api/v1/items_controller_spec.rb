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

      items = JSON.parse(response.body)
      expect(items.count).to eq(1) #this is because I'm not saving to the db to make testing easier.

      new_item = items.first
      expect(new_item['name']).to eq('Item')
      expect(new_item['description']).to eq('Description')
      expect(new_item['unit_price']).to eq(100)
      expect(new_item['merchant_id']).to eq(98)
    end
  end
end
