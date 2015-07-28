require 'csv'

namespace :import do
  task :customers => :environment do
    csv_text = File.read('db/csv/customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Customer.create!(row.to_hash)
    end
  end

  task :merchants => :environment do
    csv_text = File.read('db/csv/merchants.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Merchant.create!(row.to_hash)
    end
  end

  task :items => :environment do
    csv_text = File.read('db/csv/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Item.create!(row.to_hash)
    end
  end

  task :transactions => :environment do
    csv_text = File.read('db/csv/transactions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Transaction.create!(row.to_hash)
    end
  end

  task :invoices => :environment do
    csv_text = File.read('db/csv/invoices.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Invoice.create!(row.to_hash)
    end
  end

  task :invoice_items => :environment do
    csv_text = File.read('db/csv/invoice_items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end

end


