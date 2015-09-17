require 'rails_helper'


RSpec.describe Api::V1::MerchantsController, type: :controller do

  describe '#index' do
    it "responds OK" do
      Merchant.create(id: 1,
                      name: "Target"
                      )
      Merchant.create(id: 2,
                      name: "Walmart"
                      )
      Merchant.create(id: 3,
                      name: "Target-2"
                      )

      get :index, format: :json

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(merchant.count).to equal 3

    end
  end

  describe '#show' do
    it "responds OK" do
      Merchant.create(id: 1,
                      name: "Target"
                      )

      get :show, format: :json, id: Merchant.first.id

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(merchant[:name]).to eq "Target"
      expect(merchant[:id]).to equal 1

    end
  end

  describe '#find params name' do
    it "responds OK" do
      merchant1 = Merchant.create(id: 1,
                      name: "Target"
                      )
      merchant2 = Merchant.create(id: 2,
                      name: "Walmart"
                      )


      get :find, format: :json, name: merchant2.name

      merchant_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(merchant_json[:id]).to equal 2

    end
  end

  describe '#find params id' do
    it "responds OK" do

      Merchant.create(id: 1,
                      name: "Target"
                      )

      get :find, format: :json, id: 1

      merchant_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(merchant_json[:id]).to equal 1
      expect(merchant_json[:name]).to eq "Target"

    end
  end


  describe '#find_all params name' do
    it "responds OK" do

      Merchant.create(id: 1,
                      name: "Target"
                      )
      Merchant.create(id: 2,
                      name: "Walmart"
                      )
      Merchant.create(id: 3,
                      name: "Target"
                      )


      get :find_all, format: :json, name: "Target"

      merchant_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(merchant_json.count).to eq 2

    end
  end

  describe '#random' do
    it "responds OK" do

      Merchant.create(id: 1,
                      name: "Target"
                      )

      get :random, format: :json

      merchant_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(merchant_json.count).to eq 1
      expect(merchant_json.first[:name]).to eq "Target"

    end
  end

  describe '#revenue' do
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

      get :revenue, format: :json, id: 1

      invoice_item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect("49.8").to eq invoice_item[:revenue]

    end
  end

  describe '#most_revenue' do
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

      get :most_revenue, format: :json, quantity: 1

      invoice_item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect("Target").to eq invoice_item.first[:name]

    end
  end

  describe '#most_items' do
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

      get :most_items, format: :json, quantity: 1

      invoice_item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect("Target").to eq invoice_item.first[:name]

    end
  end

  describe '#favorite_customer' do
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

      get :favorite_customer, format: :json, id: 1

      invoice_item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect("Joe").to eq invoice_item[:first_name]

    end
  end

  describe '#customers_with_pending_invoices' do
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
                        result: "failed"
                        )

      get :customers_with_pending_invoices, format: :json, id: 1

      invoice_item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_item.count).to eq 1

    end
  end

end
