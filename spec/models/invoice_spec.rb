require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice) do
    Customer.create(id: 1,
                    first_name: "Joe",
                    last_name:  "Sampson")
    Merchant.create(id: 1,
                    name: "Target")
    invoice = Invoice.new(
               customer_id: 1,
               merchant_id: 1,
               status: "shipped")
  end

  it "creates an invoice" do
    invoice.save

    expect(Invoice.all.first.id).to eq(invoice.id)
    expect(Invoice.all.first.customer_id).to eq(1)
    expect(Invoice.all.first.merchant_id).to eq(1)
    expect(Invoice.all.first.status).to eq("shipped")
  end
end
