require 'csv'

desc "Import CSV files into an ActiveRecord table"
task :import => :environment do

  CSV.foreach('db/csv/merchants.csv', headers: true, header_converters: :symbol) do |row|
    Merchant.create!(row.to_hash)
  end

  CSV.foreach('db/csv/customers.csv', headers: true, header_converters: :symbol) do |row|
    Customer.create!(row.to_hash)
  end

  CSV.foreach('db/csv/invoices.csv', headers: true, header_converters: :symbol) do |row|
    Invoice.create!(row.to_hash)
  end

  CSV.foreach('db/csv/items.csv', headers: true, header_converters: :symbol) do |row|
    Item.create!({:id          => row[:id],
                  :name        => row[:name],
                  :description => row[:description],
                  :unit_price  => BigDecimal.new(row[:unit_price].insert(-3, '.')),
                  :merchant_id => row[:merchant_id],
                  :created_at  => row[:created_at],
                  :updated_at  => row[:updated_at]
                 })
  end

  CSV.foreach('db/csv/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
    InvoiceItem.create!({:id         => row[:id],
                         :invoice_id => row[:invoice_id],
                         :item_id    => row[:item_id],
                         :quantity   => row[:quantity],
                         :unit_price => BigDecimal.new(row[:unit_price].insert(-3, '.')),
                         :created_at => row[:created_at],
                         :updated_at => row[:updated_at]
                        })
  end

  CSV.foreach('db/csv/transactions.csv', headers: true, header_converters: :symbol) do |row|
    Transaction.create!(row.to_hash.except(:credit_card_expiration_date))
  end

end