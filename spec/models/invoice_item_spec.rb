require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  let(:invoice_item) { InvoiceItem.new(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 100)}

  it 'is valid' do
    expect(invoice_item).to be_valid
  end

  it 'is invalid without an item_id' do
    invoice_item.item_id = nil
    expect(invoice_item).to_not be_valid
  end

  it 'is invalid without an invoice id' do
    invoice_item.invoice_id = nil
    expect(invoice_item).to_not be_valid
  end

  it 'is invalid without a quantity' do
    invoice_item.quantity = nil
    expect(invoice_item).to_not be_valid
  end

  it 'is invalid without a price' do
    invoice_item.unit_price = nil
    expect(invoice_item).to_not be_valid
  end
end
