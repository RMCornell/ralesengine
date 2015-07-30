class Transaction < ActiveRecord::Base
  belongs_to :invoice

  validates :invoice_id, presence: true
  validates_numericality_of :credit_card_number, on: :create
  validates :result, presence: true

  def self.random
    Transaction.limit(1).order("RANDOM()")
  end

  def self.find_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"
    return find_by(attribute.to_sym => value ) if attribute == "invoice_id"
    return find_by(attribute.to_sym => value ) if attribute == "credit_card_number"

    where("lower(#{attribute}) LIKE ?", "#{value}").first
  end

  def self.find_all_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"
    return find_by(attribute.to_sym => value ) if attribute == "invoice_id"
    return find_by(attribute.to_sym => value ) if attribute == "credit_card_number"

    where("lower(#{attribute}) LIKE ?", "#{value}")
  end
end
