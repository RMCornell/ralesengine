class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

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
end
