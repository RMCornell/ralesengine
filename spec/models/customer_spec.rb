require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) do
    Customer.create(first_name: "First", last_name: "Last")
  end

  it 'is valid' do
    expect(customer).to be_valid
  end

  it 'is invalid without a first name' do
    customer.first_name = nil
    expect(customer).to_not be_valid
  end

  it 'is invalid without a last name' do
    customer.last_name = nil
    expect(customer).to_not be_valid
  end

  it 'responds to presence of invoices' do
   respond_to :invoice
  end
end

