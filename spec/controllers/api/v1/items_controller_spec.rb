require 'rails_helper'


RSpec.describe Api::V1::ItemsController, type: :controller do

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
    xit "responds OK" do

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
end
