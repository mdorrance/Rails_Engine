require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do

  describe '#index' do
    it "responds OK" do
      Customer.create(id: 2,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(id: 1,
                      name: "Target"
                      )
      Invoice.create(id: 1,
                     customer_id: 2,
                     merchant_id: 1,
                     status: "shipped"
                     )
      Transaction.create(
                         invoice_id: 1,
                         credit_card_number: "123456789",
                         result: "success"
                         )
      Transaction.create(
                         invoice_id: 1,
                         credit_card_number: "123456789",
                         result: "success"
                         )
      Transaction.create(
                         invoice_id: 1,
                         credit_card_number: "123456789",
                         result: "success"
                         )

      get :index, format: :json, id: 2

      transactions = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(transactions.count).to equal 3

    end
  end
end
