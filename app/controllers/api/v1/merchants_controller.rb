class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def by_name
    respond_with Merchant.find_by(name: params[:name])
  end

  def random
    respond_with Merchant.limit(1).order("RANDOM()")
  end

  def find
    respond_with Merchant.find_by_type(parameters)
  end

  def find_all
    respond_with Merchant.find_all_by_type(parameters)
  end

  def items
    respond_with Merchant.find_by(id: params[:id]).items.all
  end

  def invoices
    respond_with Merchant.find_by(id: params[:id]).invoices.all
  end

  def revenue
    respond_with Merchant.find_by(id: params[:id]).revenue
  end

  def most_revenue
    respond_with Merchant.most_revenue params[:quantity]
  end

  def most_items
    respond_with Merchant.most_items params[:quantity]
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end


end

