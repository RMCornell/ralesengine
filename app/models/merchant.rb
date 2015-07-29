class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

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
    customers.max_by { |c| c.invoices.successful.where(merchant_id: id).count }
  end

  def pending
    invoices.pending
  end
end

