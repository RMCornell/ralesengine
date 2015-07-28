class Customer < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :invoices

  def self.random
    ids = connection.select_all("SELECT id FROM customers")
    find(ids[rand(ids.length)]["id"].to_i) unless ids.blank?
  end
end
