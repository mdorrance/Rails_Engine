class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.random
    self.limit(1).order("RANDOM()")
  end

  def revenue
    key = invoices.successful_invoices.joins(:invoice_items).sum("unit_price * quantity")
    {revenue: key}
  end

  def self.most_revenue(quantity)
    self.all.sort_by { |merchant| merchant.total_revenue }.reverse.take(quantity)
  end

  def total_revenue
    invoices.successful_invoices.joins(:invoice_items).sum("unit_price * quantity")
  end
  
  def self.most_items(quantity)
    self.all.sort_by { |merchant| merchant.total_items }.reverse.take(quantity)
  end

  def total_items
     invoices.successful_invoices.joins(:invoice_items).sum("quantity")
  end

  def revenue_by_date(date)
    key = invoices.successful_invoices.joins(:invoice_items).where(created_at: (date)).sum("unit_price * quantity")
    {revenue: key}
  end

  def self.revenue_by_date(date)
    value = self.all.reduce(0) {|sum, merchant| sum + merchant.subtotal_revenue_by_date(date) }
    {total_revenue: value}
  end

  def subtotal_revenue_by_date(date)
    invoices.successful_invoices.joins(:invoice_items).where(created_at: (date)).sum("unit_price * quantity")
  end

  def favorite_customer
    Customer.find_by(id: invoices.successful_invoices.joins(:customer).group(:customer_id).count
      .sort_by { |id, count| [count, id] }.last.first)
  end

  def customers_with_pending_invoices
    invoices.pending_invoices.joins(:customer).uniq
  end





end
