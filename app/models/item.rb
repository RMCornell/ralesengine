class Item < ActiveRecord::Base
belongs_to :merchant
has_many :invoice_items

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

  def self.find_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"
    return find_by(attribute.to_sym => value ) if attribute == "unit_price"
    return find_by(attribute.to_sym => value ) if attribute == "merchant_id"

    where("lower(#{attribute}) LIKE ?", "#{value}").first
  end

  def self.find_all_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"
    return find_by(attribute.to_sym => value ) if attribute == "unit_price"
    return find_by(attribute.to_sym => value ) if attribute == "merchant_id"

    where("lower(#{attribute}) LIKE ?", "#{value}")
  end

def self.most_revenue(count)
  successful_items.group(:name).sum('"invoice_items"."quantity" * "invoice_items"."unit_price"').sort_by(&:last).last(count.to_i).reverse.map {|n, _| Item.find_by(name: n)}
end

def self.most_items(count)
  successful_items.group(:name).sum(:quantity).sort_by(&:last).last(count.to_i).reverse.map { |name, _| Item.find_by(name: name) }
end

def best_day
  invoices.successful.group('"invoices"."created_at"').sum("quantity * unit_price").sort_by(&:last).last.first
end

def self.successful_items
  joins(:invoices).merge(Invoice.successful)
end

def self.random
  Item.limit(1).order("RANDOM()")
end
end
