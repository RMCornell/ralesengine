class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def random
    respond_with Transaction.limit(1).order("RANDOM()")
  end

  def find
    respond_with Transaction.find_by(parameters)
  end

  def find_all
    respond_with Transaction.where(parameters)
  end

  def invoice
    respond_with Transaction.find_by(id: params[:id]).invoice
  end
end
