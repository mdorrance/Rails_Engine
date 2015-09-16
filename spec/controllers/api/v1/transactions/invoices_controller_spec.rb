RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do
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
      Item.create(id: 2,
                  name: "Shorts",
                  description: "Long",
                  unit_price: "1234",
                  merchant_id: 1)
      Invoice.create(id: 1,
                     customer_id: 3,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")
      Transaction.create(id: 1,
                        invoice_id: 1,
                        credit_card_number: "123456789",
                        result: "success"
                        )


      get :show, format: :json, id: 1

      invoice_item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_item[:id]).to eq 1
      expect(invoice_item[:customer_id]).to eq 3

    end
  end

end
