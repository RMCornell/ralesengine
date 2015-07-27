require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:merchant) do
    Merchant.create(name: "merchant")
  end

  it "is valid" do
    expect(merchant).to be_valid
  end

  it 'is invalid without a name' do
    merchant.name = nil
    expect(merchant).to_not be_valid
  end

  it 'responds to items' do
    respond_to :items
  end

  it 'responds to invoices' do
    respond_to :invoices
  end

  it 'responds to customers' do
    respond_to :customers
  end
end




