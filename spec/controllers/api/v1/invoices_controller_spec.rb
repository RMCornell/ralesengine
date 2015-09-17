require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do
  context '#index' do
    it 'returns all invoices' do
      customer = Customer.create(first_name: "First", last_name: "Last")
      merchant = Merchant.new(name: 'Merchant')
      merchant.save
      invoice = Invoice.new(customer_id: customer.id, merchant_id: merchant.id, status: 'success')
      invoice.save

      get :index, format: :json

      expect(response).to have_http_status(:ok)

      invoices = JSON.parse(response.body, symbolize_names: true)
      expect(invoices.count).to eq(1)

      invoice_response = invoices.first
      expect(invoice_response[:customer_id]).to eq(5)
      expect(invoice_response[:merchant_id]).to eq(3)
      expect(invoice_response[:status]).to eq('success')
    end
  end

  context '#show' do
    it 'shows an invoice' do
      customer = Customer.create(first_name: "First", last_name: "Last")
      merchant = Merchant.new(name: 'Merchant')
      merchant.save
      invoice = Invoice.new(customer_id: customer.id, merchant_id: merchant.id, status: 'success')
      invoice.save

      get :show, id: invoice.id, :format => :json

      expect(response).to have_http_status(:ok)

      invoice_response = JSON.parse(response.body, symbolize_names: true)
      expect(invoice_response[:customer_id]).to eq(6)
      expect(invoice_response[:merchant_id]).to eq(4)
      expect(invoice_response[:status]).to eq('success')
    end
  end
end
