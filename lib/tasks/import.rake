require 'csv'

desc "Import customers from csv file"
task :import => [:environment] do

  customer_file = "db/data/customers.csv"
  merchant_file = "db/data/merchants.csv"
  invoice_item_file = "db/data/invoice_items.csv"
  invoices_file = "db/data/invoices.csv"
  items_file = "db/data/items.csv"
  transactions_file = "db/data/transactions.csv"

  CSV.foreach(customer_file, :headers => true, header_converters: :symbol) do |row|
    Customer.create!(row.to_hash)
  end

  CSV.foreach(merchant_file, :headers => true, header_converters: :symbol) do |row|
    Merchant.create!(row.to_hash)
  end

  CSV.foreach(items_file, :headers => true, header_converters: :symbol) do |row|
    Item.create!(
    id: row[:id],
    name: row[:name],
    description: row[:description],
    unit_price: BigDecimal.new(row[:unit_price].insert(-3, '.')),
    merchant_id: row[:merchant_id],
    created_at: row[:created_at],
    updated_at: row[:updated_at]
    )
  end

  CSV.foreach(invoices_file, :headers => true, header_converters: :symbol) do |row|
    Invoice.create!(row.to_hash)
  end

  CSV.foreach(invoice_item_file, :headers => true, header_converters: :symbol) do |row|
    InvoiceItem.create!(
    id: row[:id],
    item_id: row[:item_id],
    invoice_id: row[:invoice_id],
    quantity: row[:quantity],
    unit_price: BigDecimal.new(row[:unit_price].insert(-3, '.')),
    created_at: row[:created_at],
    updated_at: row[:updated_at]
    )
  end

  CSV.foreach(transactions_file, :headers => true, header_converters: :symbol) do |row|
    Transaction.create!(row.to_hash)
  end

end
