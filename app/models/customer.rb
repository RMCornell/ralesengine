class Customer < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.random
    Customer.limit(1).order("RANDOM()")
  end

  def self.find_by_type(parameters)
    where(parameters).first
  end

  def self.find_all_by_type(parameters)
    where(parameters)
  end

  def favorite_merchant
    f_merchant = invoices.successful.joins(:merchant).group(:name).count.max_by { |k, v| v }
    merchants.find_by(name: f_merchant.first) if f_merchant
  end
end
