class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.random
    self.limit(1).order("RANDOM()")
  end

  def revenue
    # key = invoice_items.successful_invoice_items.pluck(:quantity, :unit_price).map do |quantity, unit_price|
    #   quantity * unit_price
    # end.reduce :+
    key = invoices.successful_invoices.joins(:invoice_items).sum("unit_price * quantity")
    {revenue: key}
  end


end
