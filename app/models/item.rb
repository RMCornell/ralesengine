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

end
