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
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"

    where("lower(#{attribute}) LIKE ?", "#{value}").first
  end

  def self.find_all_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"

    where("lower(#{attribute}) LIKE ?", "#{value}")
  end

  def revenue
      invoices.successful.joins(:invoice_items).sum('quantity * unit_price') / 100.00
  end

  def revenue_by_date(date)
    invoices.successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.most_revenue(count)
    all.sort_by { |merchant| merchant.revenue }.last(count.to_i).reverse
  end

  def total_items
    invoices.successful.joins(:invoice_items).sum(:quantity)
  end

  def self.most_items(count)
    all.sort_by { |merchant| merchant.total_items }.last(count.to_i).reverse
  end

  def favorite_customer
    hash = Hash.new(0)
    customers.map { |c| hash[c] += 1 }
    hash.max
  end

  def pending
    invoices.pending
  end
end

