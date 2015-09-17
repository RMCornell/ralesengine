class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

  def self.random
    Item.limt(1).order("RANDOM()")
  end

  def self.find_by_type(parameters)
    where(parameters).first
  end

  def self.find_all_by_type(parameters)
    where(parameters)
  end

  def self.successful_items
    joins(:invoices).merge(Invoice.successful)
  end

  def self.most_revenue(count)
    # successful_items.group(:name).sum('"invoice_items"."quantity" * "invoice_items"."unit_price"').sort_by(&:last).last(count.to_i).map {|n, _| Item.find_by(name: n)}
  end

  def self.most_items(count)
    successful_items.group(:name).sum(:quantity).sort_by(&:last).last(count.to_i).reverse.map { |name, _| Item.find_by(name: name) }
  end

  def best_day
    date = invoices.successful.group('invoices.created_at').sum(('quantity * unit_price / 100')).sort_by {|x| x.last}.reverse.first.first
    {:best_day => date}
  end
end