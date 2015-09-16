class Transaction < ActiveRecord::Base
  belongs_to :invoice

  validates :invoice_id, presence: true
  validates :credit_card_number, presence: true
  validates :result, presence: true

  def self.random
    Transaction.limit(1).order("RANDOM()")
  end

  def self.find_by_type(parameters)
    where(parameters).first
  end

  def self.find_all_by_type(parameters)
    where(parameters)
  end
end