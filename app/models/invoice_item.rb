class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  validates :item_id, presence: true
  validates :invoice_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true

  def self.random
    InvoiceItem.limit(1).order("RANDOM()")
  end

  def self.find_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"
    return find_by(attribute.to_sym => value ) if attribute == "item_id"
    return find_by(attribute.to_sym => value ) if attribute == "invoice_id"
    return find_by(attribute.to_sym => value ) if attribute == "quantity"
    return find_by(attribute.to_sym => value ) if attribute == "unit_price"

    where("lower(#{attribute}) LIKE ?", "#{value}").first
  end

  def self.find_all_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"
    return find_by(attribute.to_sym => value ) if attribute == "item_id"
    return find_by(attribute.to_sym => value ) if attribute == "invoice_id"
    return find_by(attribute.to_sym => value ) if attribute == "quantity"
    return find_by(attribute.to_sym => value ) if attribute == "unit_price"

    where("lower(#{attribute}) LIKE ?", "#{value}")
  end
end
