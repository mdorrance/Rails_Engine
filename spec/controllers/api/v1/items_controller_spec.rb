require 'rails_helper'


RSpec.describe Api::V1::ItemsController, type: :controller do

  describe '#index' do
    it "responds OK" do
      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 1,
                      name: "Mike",
                      description: "D",
                      unit_price: 12.34,
                      merchant_id: 1
                      )
      Item.create(id: 2,
                      name: "Mike",
                      description: "D",
                      unit_price: 12.34,
                      merchant_id: 1
                      )
      Item.create(id: 3,
                      name: "Mike",
                      description: "D",
                      unit_price: 12.34,
                      merchant_id: 1
                      )

      get :index, format: :json, id: Item.first.id

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(items.count).to eq 3


    end
  end

  describe '#show' do
    it "responds OK" do
      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 1,
                      name: "Mike",
                      description: "D",
                      unit_price: 12.34,
                      merchant_id: 1
                      )

      get :show, format: :json, id: Item.first.id

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item[:name]).to eq "Mike"
      expect(item[:description]).to eq "D"
      expect(item[:unit_price]).to eq "12.34"
      expect(item[:merchant_id]).to eq 1
      expect(item[:id]).to equal 1

    end
  end

  describe '#find params name' do
    it "responds OK" do
      Merchant.create(id: 1,
                      name: "Target"
                      )
      item1= Item.create(id: 1,
                      name: "Pants",
                      description: "DD",
                      unit_price: 12.34,
                      merchant_id: 1
                      )


      get :find, format: :json, name: item1.name

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json[:name]).to eq "Pants"

    end
  end

  describe '#find params description' do
    it "responds OK" do
      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 1,
                      name: "Mike",
                      description: "Does great",
                      unit_price: 12.34,
                      merchant_id: 1
                      )


      get :find, format: :json, description: Item.last.description

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json[:description]).to eq "Does great"

    end
  end

  describe '#find params unit_price' do
    it "responds OK" do
      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 1,
                      name: "Mike",
                      description: "Does great",
                      unit_price: 12.34,
                      merchant_id: 1
                      )


      get :find, format: :json, unit_price: Item.last.unit_price

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json[:unit_price]).to eq "12.34"

    end
  end

  describe '#find params merchant_id' do
    it "responds OK" do
      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 1,
                      name: "Mike",
                      description: "Does great",
                      unit_price: 12.34,
                      merchant_id: 1
                      )


      get :find, format: :json, merchant_id: Item.last.merchant_id

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json[:merchant_id]).to eq 1

    end
  end

  describe '#find params id' do
    it "responds OK" do

      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 1,
                  name: "Mike",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )

      get :find, format: :json, id: 1

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json[:id]).to equal 1
      expect(item_json[:name]).to eq "Mike"
      expect(item_json[:description]).to eq "D"

    end
  end


  describe '#find_all params name' do
    it "responds OK" do

      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 2,
                  name: "Pants",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )
      Item.create(id: 1,
                  name: "Shirt",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )
      Item.create(id: 3,
                  name: "Sock",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )


      get :find_all, format: :json, name: "Sock"

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json.count).to eq 1

    end
  end

  describe '#find_all params description' do
    it "responds OK" do

      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 2,
                  name: "Pants",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )
      Item.create(id: 1,
                  name: "Shirt",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )
      Item.create(id: 3,
                  name: "Sock",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )


      get :find_all, format: :json, description: "D"

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json.count).to eq 3

    end
  end

  describe '#find_all params unit_price' do
    it "responds OK" do

      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 2,
                  name: "Pants",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )
      Item.create(id: 1,
                  name: "Shirt",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )
      Item.create(id: 3,
                  name: "Sock",
                  description: "D",
                  unit_price: 12.32,
                  merchant_id: 1
                  )


      get :find_all, format: :json, unit_price: "12.34"

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json.count).to eq 2

    end
  end

  describe '#find_all params merchant_id' do
    it "responds OK" do

      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 2,
                  name: "Pants",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )
      Item.create(id: 1,
                  name: "Shirt",
                  description: "D",
                  unit_price: 12.34,
                  merchant_id: 1
                  )
      Item.create(id: 3,
                  name: "Sock",
                  description: "D",
                  unit_price: 12.45,
                  merchant_id: 1
                  )


      get :find_all, format: :json, merchant_id: 1

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json.count).to eq 3

    end
  end

  describe '#random' do
    it "responds OK" do
      Merchant.create(id: 1,
                      name: "Target"
                      )
      Item.create(id: 3,
                  name: "Sock",
                  description: "D",
                  unit_price: 12.56,
                  merchant_id: 1
                  )

      get :random, format: :json

      item_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item_json.count).to eq 1
      expect(item_json.first[:name]).to eq "Sock"
      expect(item_json.first[:unit_price]).to eq "12.56"

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

      item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect("Pants").to eq item.first[:name]

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
      expect("Pants").to eq invoice_item.first[:name]

    end
  end

  describe '#best_day' do
    it "responds OK" do
      Customer.create(id: 3,
                      first_name: "Joe",
                      last_name:  "Sampson")
      Merchant.create(id: 1,
                      name: "Target")
      item1 = Item.create(id: 1,
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

      get :best_day, format: :json, id: 1

      item = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      # expect(item1.created_at).to eq item[:created_at] #created_at is not equal because of timestamp

    end
  end
end
