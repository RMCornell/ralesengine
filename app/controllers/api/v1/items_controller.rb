class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def random
    respond_with Item.limit(1).order("RANDOM()")
  end

  def find
    respond_with Item.find_by_type(parameters)
  end

  def find_all
    respond_with Item.find_all_by_type(parameters)
  end

  def invoice_items
    respond_with Item.find_by(id: params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find_by(id: params[:id]).merchant
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.most_items(params[:quantity])
  end

  def best_day
    respond_with set_item.best_day
  end

  private

  def set_item
    Item.find_by(id: params[:id])
  end
end
