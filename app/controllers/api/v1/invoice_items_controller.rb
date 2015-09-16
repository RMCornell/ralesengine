class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def random
    respond_with InvoiceItem.random
  end

  def find
    respond_with InvoiceItem.find_by_type(invoice_items_parameters)
  end

  def find_all
    respond_with InvoiceItem.find_all_by_type(invoice_items_parameters)
  end

  def invoice
    respond_with InvoiceItem.find_by(id: params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find_by(id: params[:id]).item
  end

  private

  def invoice_items_parameters
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
