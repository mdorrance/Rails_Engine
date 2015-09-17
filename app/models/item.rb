class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.random
    self.limit(1).order("RANDOM()")
  end

  def most_revenue
    invoice_items.successful_invoice_items.sum("unit_price * quantity")
  end

  def most_items
    invoice_items.successful_invoice_items.sum("quantity")
  end

  def best_day
    day = invoices.successful_invoices.group('invoices.created_at').sum('quantity * unit_price').sort_by { |date, revenue| [revenue] }.last.first
    { best_day: day }
  end

end
