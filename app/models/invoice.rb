class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant

  validates :customer_id, presence: true, uniqueness: true
  validates :merchant_id, presence: true, uniqueness: true
  validates :status, presence: true
end
