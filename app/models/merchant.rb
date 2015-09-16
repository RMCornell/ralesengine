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

  def self.revenue_for_date(date)
    day = date.to_date
    joins(:invoices).merge(Invoice.successful).where(invoices: {created_at: day.beginning_of_day..day.end_of_day}).includes(:invoice_items).sum("quantity * unit_price") / 100
  end

  def revenue(date = nil)
    if date
      day = date.to_date
      invoices.successful.where(created_at: day.beginning_of_day..day.end_of_day).joins(:invoice_items).sum("quantity * unit_price") /100
    else
      invoices.successful.joins(:invoice_items).sum("quantity * unit_price") / 100
    end
  end

  def revenue_for_date(date)
     invoices.successful.where(created_at: date).joins(:invoice_items).sum('quantity * unit_price') / 100.00
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
    hash = Hash.new(0)
    customers.map { |c| hash[c] += 1 }
    max_value = hash.values.max
    hash.map { |k, v| k if v == max_value}.compact
  end

  def pending_invoices
    invoices.pending
  end
end
