class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def self.random
    self.limit(1).order("RANDOM()")
  end
end
