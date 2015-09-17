require 'rails_helper'


RSpec.describe Api::V1::CustomersController, type: :controller do

  describe '#index' do
    it "responds OK" do
      Customer.create(id: 1,
                      first_name: "Mike",
                      last_name: "D"
                      )
      Customer.create(id: 2,
                      first_name: "Mike",
                      last_name: "Dorr"
                      )
      Customer.create(id: 3,
                      first_name: "Mike",
                      last_name: "Dorrance"
                      )

      get :index, format: :json

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer.count).to equal 3

    end
  end

  describe '#show' do
    it "responds OK" do
      Customer.create(id: 1,
                      first_name: "Mike",
                      last_name: "D"
                      )

      get :show, format: :json, id: Customer.first.id

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer[:first_name]).to eq "Mike"
      expect(customer[:last_name]).to eq "D"
      expect(customer[:id]).to equal 1

    end
  end

  describe '#find params first_name' do
    it "responds OK" do
      customer1 = Customer.create(id: 1,
                      first_name: "Mike",
                      last_name: "D"
                      )
      customer2 = Customer.create(id: 2,
                      first_name: "Joe",
                      last_name: "Dear"
                      )


      get :find, format: :json, first_name: customer2.first_name

      customer_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer_json[:first_name]).to eq "Joe"

    end
  end

  describe '#find params last_name' do
    it "responds OK" do
      customer1 = Customer.create(id: 1,
                      first_name: "Mike",
                      last_name: "D"
                      )
      customer2 = Customer.create(id: 2,
                      first_name: "Joe",
                      last_name: "Dear"
                      )


      get :find, format: :json, last_name: customer1.last_name

      customer_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer_json[:last_name]).to eq "D"

    end
  end

  describe '#find params id' do
    it "responds OK" do

      Customer.create(id: 1,
                      first_name: "Mike",
                      last_name: "D"
                      )

      get :find, format: :json, id: 1

      customer_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer_json[:id]).to equal 1
      expect(customer_json[:first_name]).to eq "Mike"
      expect(customer_json[:last_name]).to eq "D"

    end
  end


  describe '#find_all params name' do
    it "responds OK" do

      Customer.create(id: 1,
                      first_name: "Mike",
                      last_name: "D"
                      )
      Customer.create(id: 2,
                      first_name: "Mike",
                      last_name: "Reeves"
                      )
      Customer.create(id: 3,
                      first_name: "Mike",
                      last_name: "Doe"
                      )


      get :find_all, format: :json, first_name: "Mike"

      customer_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer_json.count).to eq 3

    end
  end

  describe '#random' do
    it "responds OK" do

      Customer.create(id: 1,
                      first_name: "Mike",
                      last_name: "D"
                      )

      get :random, format: :json

      customer_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer_json.count).to eq 1
      expect(customer_json.first[:first_name]).to eq "Mike"
      expect(customer_json.first[:last_name]).to eq "D"

    end
  end

  describe '#favorite_merchant' do
    it "responds OK" do
      Customer.create(id: 3,
                      first_name: "Joe",
                      last_name:  "Sampson")
      Merchant.create(id: 1,
                      name: "Target")
      Item.create(id: 1,
                  name: "Pants",
                  description: "Long",
                  unit_price: 12.45,
                  merchant_id: 1)
      Invoice.create(id: 1,
                     customer_id: 3,
                     merchant_id: 1,
                     status: "shipped")
      Invoice.create(id: 2,
                     customer_id: 3,
                     merchant_id: 1,
                     status: "shipped")
      Invoice.create(id: 3,
                     customer_id: 3,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: 2,
                         unit_price: 12.45)
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: 2,
                         unit_price: 12.45)
     Transaction.create(
                        invoice_id: 1,
                        credit_card_number: "123456789",
                        result: "success"
                        )

      get :favorite_merchant, format: :json, id: 3

      invoice_item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect("Target").to eq invoice_item[:name]

    end
  end
end
