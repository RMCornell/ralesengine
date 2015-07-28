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
    respond_with Merchant.find_by(parameters)
  end

  def find_all
    respond_with Merchant.where(parameters)
  end
end

