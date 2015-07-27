require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { Transaction.new(invoice_id: 1, credit_card_number: 4242424242424242, result: "success") }

  it 'is valid' do
    expect(transaction).to be_valid
  end

  it 'is invalid without and invoice id' do
    transaction.invoice_id = nil
    expect(transaction).to_not be_valid
  end

  it 'is invalid without a credit card number' do
    transaction.credit_card_number = nil
    expect(transaction).to_not be_valid
  end

  it 'is invalid without a result' do
    transaction.result = nil
    expect(transaction).to_not be_valid
    end
end
