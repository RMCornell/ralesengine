class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def random
    respond_with Merchant.random
  end

  def find
    respond_with Merchant.find_by_type(merchants_parameters)
  end

  def find_all
    respond_with Merchant.find_all_by_type(merchants_parameters)
  end

  def items
    respond_with Merchant.find_by(id: params[:id]).items.all
  end

  def invoices
    respond_with Merchant.find_by(id: params[:id]).invoices.all
  end

  def revenue
    if params[:id]
      respond_with Merchant.find_by(id: params[:id]).revenue(params[:date])
    else
      respond_with Merchant.find_by(id: params[:id]).revenue_for_date(params[:date])
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
    respond_with Merchant.find(params[:id]).pending_invoices
  end

  private

  def merchants_parameters
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
