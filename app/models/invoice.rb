class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true

  def self.random
    Invoice.limit(1).order("RANDOM()")
  end

  def self.find_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"
    return find_by(attribute.to_sym => value ) if attribute == "customer_id"
    return find_by(attribute.to_sym => value ) if attribute == "merchant_id"

    where("lower(#{attribute}) LIKE ?", "#{value}").first
  end

  def self.find_all_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"
    return find_by(attribute.to_sym => value ) if attribute == "customer_id"
    return find_by(attribute.to_sym => value ) if attribute == "merchant_id"

    where("lower(#{attribute}) LIKE ?", "#{value}")
  end

  def self.successful
    joins(:transactions).where(transactions: {result: "success"})
  end

  def self.pending
    joins(:transactions).where(transactions: {result: "failed"})
  end
end
