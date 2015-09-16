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
    where(parameters).first
  end

  def self.find_all_by_type(parameters)
    where(parameters)
  end

  def self.successful
    joins(:transactions).where(transactions: {result: "success"})
  end

  def pending
    joins(:transactions).where(transactions: {result: "failed"})
  end
end
