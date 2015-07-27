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
end




