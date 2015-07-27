class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  validates :item_id, presence: true, uniqueness: true
  validates :invoice_id, presence: true, uniqueness: true
  validates :quantity, presence: true
  validates :unit_price, presence: true
end
