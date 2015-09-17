class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    Merchant.find_by(id: invoices.successful_invoices.joins(:merchant).group(:merchant_id).count
      .sort_by { |id, count| [count, id] }.last.first)
  end
end
