require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice) { Invoice.new(customer_id: 1, merchant_id: 1, status: "shipped") }

  it 'is valid' do
    expect(invoice).to be_valid
  end

  it 'is invalid without a customer id' do
    invoice.customer_id = nil
    expect(invoice).to_not be_valid
  end

  it 'is invalid without a merchant_id' do
    invoice.merchant_id = nil
    expect(invoice).to_not be_valid
  end

  it 'is invalid without a status' do
    invoice.status = nil
    expect(invoice).to_not be_valid
  end

  it 'responds to invoice items' do
    respond_to :invoice_items
  end

  it 'responds to items' do
    respond_to :items
  end

  it 'responds to customer' do
    respond_to :customer
  end

  it 'responds to merchant' do
    respond_to :merchant
  end

  it 'responds to transactions' do
    respond_to :transaction
  end
end

