class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.random
    self.limit(1).order("RANDOM()")
  end

  def self.revenue(merchant_id)
    revenue = 0
    Merchant.find(merchant_id).invoice_items.successful_invoice_items.pluck(:quantity, :unit_price).flatten.each do |quantity, unit_price|
      revenue += (quantity.to_i * unit_price.to_i)
    end
    revenue
  end
end
