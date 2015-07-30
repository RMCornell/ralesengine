class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def random
    respond_with Customer.random
  end

  def find
    respond_with Customer.find_by_type(parameters)
  end

  def find_all
    respond_with Customer.find_all_by_type(parameters)
  end

  def invoices
    respond_with Customer.find_customer.invoices.all
  end

  def transactions
    respond_with Customer.find_customer.transactions.all
  end

  def favorite_merchant
    hash = Hash.new(0)
    merchants.map { |c| hash[c] += 1 }
    hash.max
  end

  private

  def find_customer
    Customer.find_by(id: params[:id])
  end
end
