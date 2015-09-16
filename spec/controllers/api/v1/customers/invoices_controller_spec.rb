require 'rails_helper'

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do

  describe '#index' do
    it "responds OK" do
      Customer.create(id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(id: 1,
                      name: "Target"
                      )
      Invoice.create(
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )
      Invoice.create(
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      get :index, format: :json, id: 1

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice.count).to equal 2

    end
  end
end
