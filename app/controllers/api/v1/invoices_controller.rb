class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with find_invoice
  end

  def random
    respond_with Invoice.random
  end

  def find
    respond_with Invoice.find_by_type(invoice_parameters)
  end

  def find_all
    respond_with Invoice.find_all_by_type(invoice_parameters)
  end

  def transactions
    respond_with find_invoice.transactions.all
  end

  def invoice_items
    respond_with find_invoice.invoice_items.all
  end

  def items
    respond_with find_invoice.items.all
  end

  def customer
    respond_with find_invoice.customer
  end

  def merchant
    respond_with find_invoice.merchant
  end

  private

  def find_invoice
    Invoice.find_by(id: params[:id])
  end

  def invoice_parameters
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end