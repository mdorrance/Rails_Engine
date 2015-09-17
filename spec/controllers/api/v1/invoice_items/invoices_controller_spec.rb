require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::InvoicesController, type: :controller do
  describe '#show' do
    it "responds OK" do
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
     transaction = Transaction.create(
                        invoice_id: invoice.id,
                        credit_card_number: "123456789",
                        result: "success"
                        )

      get :show, format: :json, id: invoice_item.id
      invoice= JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice[:customer_id]).to eq 1

    end
  end

end
