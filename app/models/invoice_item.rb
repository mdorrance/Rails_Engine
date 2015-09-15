class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  def self.random
    self.limit(1).order("RANDOM()")
  end

end
