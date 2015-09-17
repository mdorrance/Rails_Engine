require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  let(:invoice_item) do
    Customer.create(id: 1,
                    first_name: "Joe",
                    last_name:  "Sampson")
    Merchant.create(id: 1,
                    name: "Target")
    Invoice.create(id: 1,
                   customer_id: 1,
                   merchant_id: 1,
                   status: "shipped")
    InvoiceItem.new(invoice_id: 1,
             quantity:  2,
             unit_price: 12.34)
  end

  it "creates a user" do
    invoice_item.save

    expect(InvoiceItem.all.first.invoice_id).to eq(1)
    expect(InvoiceItem.all.first.quantity).to eq(2)
    expect(InvoiceItem.all.first.unit_price).to eq(12.34)
  end
end
