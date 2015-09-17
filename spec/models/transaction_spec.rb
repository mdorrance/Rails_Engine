require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) do
    customer =Customer.create(id: 1,
                    first_name: "Joe",
                    last_name:  "Sampson")
    merchant =Merchant.create(id: 1,
                    name: "Target")
    item = Item.create(
                name: "Pants",
                description: "Long",
                unit_price: 12.34,
                merchant_id: merchant.id)
    invoice = Invoice.create(
                   customer_id: 1,
                   merchant_id: merchant.id,
                   status: "shipped")
    invoice_item = InvoiceItem.create(
                       invoice_id: invoice.id,
                       quantity: 2,
                       unit_price: 12.34)
   transaction = Transaction.new(
                      invoice_id: invoice.id,
                      credit_card_number: "123456789",
                      result: "success"
                      )
  end

  it "creates an transaction" do
    transaction.save

    expect(Transaction.all.first.id).to eq(transaction.id)
    expect(Transaction.all.first.credit_card_number).to eq("123456789")
    expect(Transaction.all.first.result).to eq("success")
  end
end
