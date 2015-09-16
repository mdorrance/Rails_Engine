class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  def self.random
    self.limit(1).order("RANDOM()")
  end

  def self.successful_invoice_items
    joins(:transactions).where('transactions.result' => "success")
  end

end
