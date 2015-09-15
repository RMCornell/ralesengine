class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def by_name
    respond_with Merchant.find_by(name: params[:name])
  end

  def random
    respond_with Merchant.random
  end

  def find
    respond_with Merchant.find_by_type(parameters)
  end

  def find_all
    respond_with Merchant.find_all_by_type(parameters)
  end

  def items
    respond_with Merchant.find(params[:id]).items.all
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices.all
  end

  def revenue
    if params.has_key?(:date)
      respond_with Merchant.find(params[:id]).revenue_by_date(params[:date])
    else
      respond_with Merchant.find(params[:id]).revenue
    end
  end

  def most_revenue
    respond_with Merchant.most_revenue params[:quantity]
  end

  def most_items
    respond_with Merchant.most_items params[:quantity]
  end

  def favorite_customer
    respond_with Merchant.find(params[:id]).favorite_customer
  end

  def customers_with_pending_invoices
    respond_with Merchant.find(params[:id]).pending
  end

  private

  def find_merchant
    Merchant.find_by(id: params[:id])
  end


end

