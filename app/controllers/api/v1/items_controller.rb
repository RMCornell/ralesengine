class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with find_item
  end

  def random
    respond_with Item.random
  end

  def find
    respond_with Item.find_by_type(items_parameters)
  end

  def find_all
    respond_with Item.find_all_by_type(items_parameters)
  end

  def invoice_items
    respond_with find_item.invoice_items
  end

  def merchant
    respond_with find_item.merchant
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.most_items(params[:quantity])
  end

  def best_day
    respond_with find_item.best_day
  end

  private

  def find_item
    Item.find_by(id: params[:id])
  end

  def items_parameters
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end