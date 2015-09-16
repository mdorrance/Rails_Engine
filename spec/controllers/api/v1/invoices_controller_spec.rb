require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do

  describe '#show' do
    it "responds OK" do
      Customer.create(
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(
                      name: "Target"
                      )
      Invoice.create(
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      get :show, format: :json, id: Invoice.first.id

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice[:merchant_id]).to equal 1
      expect(invoice[:customer_id]).to equal 1

    end
  end

  describe '#find' do
    it "responds OK" do
      Customer.create(id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(id: 1,
                      name: "Target"
                      )
      invoice = Invoice.create(
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      get :find, format: :json, id: Invoice, customer_id: "1"

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice[:merchant_id]).to equal 1
      expect(invoice.customer.first_name).to eq "Joe"

    end
  end

  describe '#find params customer_id' do
    it "responds OK" do
      Customer.create(id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(id: 1,
                      name: "Target"
                      )
      invoice = Invoice.create(
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      get :find, format: :json, id: Invoice, customer_id: "1"

      invoice_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_json[:merchant_id]).to equal 1
      expect(invoice_json[:customer_id]).to eq 1

    end
  end
  describe '#find params merchant_id' do
    it "responds OK" do
      Customer.create(id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(id: 1,
                      name: "Target"
                      )
      invoice = Invoice.create(
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      get :find, format: :json, id: Invoice, merchant_id: "1"

      invoice_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_json[:merchant_id]).to equal 1
      expect(invoice_json[:customer_id]).to eq 1

    end
  end

  describe '#find params status' do
    it "responds OK" do
      Customer.create(id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(id: 1,
                      name: "Target"
                      )
      invoice = Invoice.create(
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      get :find, format: :json, id: Invoice, status: "shipped"

      invoice_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_json[:merchant_id]).to equal 1
      expect(invoice_json[:status]).to eq "shipped"

    end
  end

  describe '#find_all params status' do
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

      get :find_all, format: :json, id: Invoice, status: "shipped"

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json.count).to eq 2

    end
  end
  describe '#find_all params merchant_id' do
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
      Invoice.create(
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      get :find_all, format: :json, id: Invoice, merchant_id: 1

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json.count).to eq 3

    end
  end
  describe '#find_all params customer_id' do
    it "responds OK" do
      Customer.create(id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Customer.create(id: 2,
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
                     customer_id: 2,
                     merchant_id: 1,
                     status: "shipped"
                     )
      Invoice.create(
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      get :find_all, format: :json, id: Invoice, customer_id: 1

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json.count).to eq 2

    end
  end
  describe '#random' do
    it "responds OK" do
      Customer.create(id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Customer.create(id: 2,
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


      get :random, format: :json

      invoice_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_json.count).to eq 1
      expect(invoice_json.first[:merchant_id]).to eq 1

    end
  end
end
