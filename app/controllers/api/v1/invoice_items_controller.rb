class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def random
    respond_with InvoiceItem.random
  end

  def find
    respond_with InvoiceItem.find_by_type(parameters)
  end

  def find_all
    respond_with InvoiceItem.find_all_by_type(parameters)
  end

  def invoice
    respond_with InvoiceItem.find(params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find_invoice_item.item
  end

  private

  def find_invoice_item
    InvoiceItem.find_by(id: params[:id])
  end
end
