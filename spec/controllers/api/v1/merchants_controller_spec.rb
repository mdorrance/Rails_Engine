require 'rails_helper'


RSpec.describe Api::V1::MerchantsController, type: :controller do

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
end
