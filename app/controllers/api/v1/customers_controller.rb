class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def random
    respond_with Customer.limit(1).order("RANDOM()")
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
    respond_with find_customer.favorite_merchant
  end

  private

  def find_customer
    Customer.find_by(id: params[:id])
  end
end
