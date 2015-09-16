require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do
  describe '#show' do
    it "responds OK" do
      Customer.create(id: 3,
                      first_name: "Joe",
                      last_name:  "Sampson")
      Merchant.create(id: 1,
                      name: "Target")
      Item.create(id: 1,
                  name: "Pants",
                  description: "Long",
                  unit_price: "1234",
                  merchant_id: 1)
      Invoice.create(id: 1,
                     customer_id: 3,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(id: 1,
                         item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :show, format: :json, id: 1

      invoice_item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_item[:merchant_id]).to eq 1
      expect(invoice_item[:name]).to eq "Pants"

    end
  end

end
