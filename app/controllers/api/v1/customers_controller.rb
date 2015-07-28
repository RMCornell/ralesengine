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
    respond_with Customer.find_by(parameters)
  end

  def find_all
    respond_with Customer.where(parameters)
  end

  def invoices
    respond_with Customer.find_by(id: params[:id]).invoices.all
  end

  def transactions
    respond_with Customer.find_by(id: params[:id]).transactions.all
  end
end
