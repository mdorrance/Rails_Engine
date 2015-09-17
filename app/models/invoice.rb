class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items


  def self.random
    self.limit(1).order("RANDOM()")
  end

  def self.successful_invoices
    joins(:transactions).where('transactions.result' => "success")
  end

  def self.revenue(invoice_item_id)
    self.where(id:(invoice_item_id)).sum('quantity * unit_price')
  end

  def self.pending_invoices
    joins(:transactions).where('transactions.result' => "failed")
  end
end
