class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def self.random
    Merchant.limit(1).order("RANDOM()")
  end

  def self.find_by_type(parameters)
    where(parameters).first
  end

  def self.find_all_by_type(parameters)
    where(parameters)
  end

  def total_revenue
    invoices.successful.joins(:invoice_items).sum('quantity * unit_price').to_f
  end

  def revenue(date)
    if date
      day = date.to_date
      {revenue: invoices.successful.where(created_at: day.beginning_of_day..day.end_of_day).joins(:invoice_items).sum("quantity * unit_price")}
    else
      {revenue: invoices.successful.joins(:invoice_items).sum("quantity * unit_price")}
    end
  end

  def total_items
    invoices.successful.joins(:invoice_items).sum(:quantity)
  end

  def self.most_items(quantity)
    all.sort_by { |merchant| merchant.total_items }.last(quantity.to_i).reverse
  end

  def self.most_revenue(quantity)
    all.sort_by { |merchant| merchant.total_revenue }.last(quantity.to_i).reverse
  end

  def favorite_customer

  end

  def pending_invoices

  end

  def customers_with_pending_invoices

  end
end
