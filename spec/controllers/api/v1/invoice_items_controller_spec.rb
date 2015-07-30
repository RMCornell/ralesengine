require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  context '#index' do
    it 'returns all invoice items' do
      merchant = Merchant.new(name: 'Merchant')
      merchant.save

      customer = Customer.new(first_name: "First", last_name: "Last")
      customer.save

      item = Item.new(name: "Item", description: 'Description', unit_price: 100, merchant_id: merchant.id)
      item.save

      invoice = Invoice.new(customer_id: customer.id, merchant_id: merchant.id, status: 'success')
      invoice.save

      invoice_item = InvoiceItem.new(item_id: item.id, invoice_id: invoice.id, quantity: 1, unit_price: 100)
      invoice_item.save

      get :index, format: :json

      expect(response). to have_http_status(:ok)

      invoice_items = JSON.parse(response.body)
      expect(invoice_items.count).to eq(1)

      invoice_item = invoice_items.first
      # expect(invoice_item['item_id']).to eq(1)
      # expect(invoice_item['invoice_id']).to eq(1)
      expect(invoice_item['quantity']).to eq(1)
      expect(invoice_item['unit_price']).to eq(100)
    end
  end

  context '#show' do
    it 'shows an invoice item' do
      merchant = Merchant.new(name: 'Merchant')
      merchant.save

      customer = Customer.new(first_name: "First", last_name: "Last")
      customer.save

      item = Item.new(name: "Item", description: 'Description', unit_price: 100, merchant_id: merchant.id)
      item.save

      invoice = Invoice.new(customer_id: customer.id, merchant_id: merchant.id, status: 'success')
      invoice.save

      invoice_item = InvoiceItem.new(item_id: item.id, invoice_id: invoice.id, quantity: 1, unit_price: 100)
      invoice_item.save

      get :show, id: invoice_item.id, format: :json

      expect(response).to have_http_status(:ok)

      invoice_item_response = JSON.parse(response.body)
      # expect(invoice_item['item_id']).to eq(1)
      # expect(invoice_item['invoice_id']).to eq(1)
      expect(invoice_item['quantity']).to eq(1)
      expect(invoice_item['unit_price']).to eq(100)
    end
  end
end
