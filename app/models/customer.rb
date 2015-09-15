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
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value) if  attribute == "id" || attribute == "created_at" || attribute == "updated_at"

    where("lower(#{attribute}) ILIKE ?", "#{value}").first
  end

  def self.find_all_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value) if  attribute == "id" || attribute == "created_at" || attribute == "updated_at"

    where("lower(#{attribute}) ILIKE ?", "#{value}").first
  end

  def favorite_merchant
    hash = Hash.new(0)
    merchants.map { |m| hash[m] += 1 }
    hash.max.first
  end

end
