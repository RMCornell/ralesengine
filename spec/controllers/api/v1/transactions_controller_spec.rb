require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  context '#index' do
    it 'returns all transactions' do
      customer = Customer.create(first_name: "First", last_name: "Last")
      merchant = Merchant.new(name: 'Merchant')
      merchant.save
      invoice = Invoice.new(customer_id: customer.id, merchant_id: merchant.id, status: 'success')
      invoice.save

      transaction = Transaction.new(invoice_id: invoice.id, result: 'success', credit_card_number: 4242424242424242)
      transaction.save

      get :index, format: :json

      expect(response).to have_http_status(:ok)

      transactions = JSON.parse(response.body, symbolize_names: true)
      expect(transactions.count).to eq(1)

      transaction = transactions.first
      expect(transaction[:invoice_id]).to eq(5)
      expect(transaction[:result]).to eq('success')
      expect(transaction[:credit_card_number]).to eq("4242424242424242")

    end
  end

  context '#show' do
    it 'shows a transaction' do
      customer = Customer.create(first_name: "First", last_name: "Last")
      merchant = Merchant.new(name: 'Merchant')
      merchant.save
      invoice = Invoice.new(customer_id: customer.id, merchant_id: merchant.id, status: 'success')
      invoice.save

      transaction = Transaction.new(invoice_id: invoice.id, result: 'success', credit_card_number: 4242424242424242)
      transaction.save

      get :show, id: transaction.id, format: :json

      expect(response).to have_http_status(:ok)

      transaction_response = JSON.parse(response.body, symbolize_names: true)
      expect(transaction_response[:invoice_id]).to eq(6)
      expect(transaction_response[:result]).to eq('success')
      expect(transaction_response[:credit_card_number]).to eq("4242424242424242")
    end
  end
end
