class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with find_invoices
  end

  def random
    respond_with Invoice.random
  end

  def find
    respond_with Invoice.find_by_type(parameters)
  end

  def find_all
    respond_with Invoice.find_all_by_type(parameters)
  end

  def transactions
    respond_with Invoice.find_invoices.transactions.all
  end

  def invoice_items
    respond_with Invoice.find_invoices.invoice_items.all
  end

  def items
    respond_with Invoice.find_invoices.items.all
  end

  def customer
    respond_with Invoice.find_invoices.customer
  end

  def merchant
    respond_with Invoice.find_invoices.merchant
  end

  private

  def find_invoices
    Invoice.find_by(id: params[:id])
  end
end
