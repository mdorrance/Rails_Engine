require 'rails_helper'


RSpec.describe Api::V1::InvoiceItemsController, type: :controller do

  describe '#show' do
    it "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :show, format: :json, id: InvoiceItem.first.id

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_item[:item_id]).to equal 1
      expect(invoice_item[:invoice_id]).to equal 1

    end
  end

  describe '#find item_id' do
    it "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :find, format: :json, item_id: "1"

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json[:invoice_id]).to equal 1
      expect(invoice_json[:quantity]).to eq "2"

    end
  end

  describe '#find params invoice_id' do
    it "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :find, format: :json, invoice_id: "1"

      invoice_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_json[:item_id]).to equal 1
      expect(invoice_json[:quantity]).to eq "2"
      expect(invoice_json[:unit_price]).to eq "1234"

    end
  end
  describe '#find params quantity' do
    it "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :find, format: :json, quantity: "2"

      invoice_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_json[:unit_price]).to eq "1234"
      expect(invoice_json[:invoice_id]).to eq 1

    end
  end

  describe '#find params unit_price' do
    it "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :find, format: :json, unit_price: "1234"

      invoice_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_json[:invoice_id]).to equal 1
      expect(invoice_json[:quantity]).to eq "2"

    end
  end

  describe '#find_all params item_id' do
    it "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :find_all, format: :json, item_id: 1

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json.count).to eq 2

    end
  end
  describe '#find_all params invoice_id' do
    xit "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :find_all, format: :json, invoice_id: 1

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json.count).to eq 3

    end
  end
  describe '#find_all params quantity' do
    xit "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "1",
                         unit_price: "1234")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :find_all, format: :json, quantity: "2"

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json.count).to eq 2

    end
  end
  describe '#find_all params unit_price' do
    xit "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "1",
                         unit_price: "1234")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")

      get :find_all, format: :json, unit_price: "1234"

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json.count).to eq 3

    end
  end
  describe '#random' do
    it "responds OK" do
      Customer.create(id: 1,
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
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped")
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: "2",
                         unit_price: "1234")


      get :random, format: :json

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json.count).to eq 1
      expect(invoice_json.first[:invoice_id]).to eq 1

    end
  end
end
