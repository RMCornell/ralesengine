class Transaction < ActiveRecord::Base
  belongs_to :invoice

  validates :invoice_id, presence: true
  validates_numericality_of :credit_card_number, on: :create
  validates :result, presence: true
end
