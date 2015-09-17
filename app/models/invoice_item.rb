class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  def self.random
    self.limit(1).order("RANDOM()")
  end

  def self.successful_invoice_items
    self.joins(:transactions).where('transactions.result' => "success")
  end

  def self.revenue(invoice_item_id)
    self.where(id:(invoice_item_id)).sum('quantity * unit_price')
  end

end
