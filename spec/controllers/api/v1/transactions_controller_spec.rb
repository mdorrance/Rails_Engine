require 'rails_helper'


RSpec.describe Api::V1::TransactionsController, type: :controller do

  describe '#show' do
    it "responds OK" do
      Customer.create(
                      id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(
                      id: 1,
                      name: "Target"
                      )
      Invoice.create(
                     id: 1,
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      Transaction.create(
                         invoice_id: 1,
                         credit_card_number: "123456789",
                         result: "success"
                         )

      get :show, format: :json, id: Transaction.first.id

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(transaction[:invoice_id]).to equal 1
      expect(transaction[:result]).to eq "success"
      expect(transaction[:credit_card_number]).to eq "123456789"

    end
  end

  describe '#find params invoice_id' do
    it "responds OK" do
      Customer.create(
                      id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(
                      id: 1,
                      name: "Target"
                      )
      Invoice.create(
                     id: 1,
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      transaction = Transaction.create(
                         invoice_id: 1,
                         credit_card_number: "123456789",
                         result: "success"
                         )

      get :find, format: :json, invoice_id: 1

      transaction_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(transaction[:invoice_id]).to equal 1
      expect(transaction_json[:credit_card_number]).to eq "123456789"

    end
  end

  describe '#find params credit_card_number' do
    it "responds OK" do
      Customer.create(
                      id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(
                      id: 1,
                      name: "Target"
                      )
      Invoice.create(
                     id: 1,
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      Transaction.create(
                         invoice_id: 1,
                         credit_card_number: "123456789",
                         result: "success"
                         )


      get :find, format: :json, credit_card_number: "123456789"

      invoice_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(invoice_json[:credit_card_number]).to eq "123456789"
      expect(invoice_json[:invoice_id]).to eq 1

    end
  end
  describe '#find params result' do
    it "responds OK" do
      Customer.create(
                      id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(
                      id: 1,
                      name: "Target"
                      )
      Invoice.create(
                     id: 1,
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      Transaction.create(
                         invoice_id: 1,
                         credit_card_number: "123456789",
                         result: "success"
                         )


      get :find, format: :json, id: Transaction, result: "success"

      transaction_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(transaction_json[:invoice_id]).to equal 1
      expect(transaction_json[:credit_card_number]).to eq "123456789"

    end
  end

  describe '#find_all params result' do
    it "responds OK" do
      Customer.create(
                      id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(
                      id: 1,
                      name: "Target"
                      )
      Invoice.create(
                     id: 1,
                     customer_id: 1,
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

      get :find_all, format: :json, id: Transaction, result: "success"

      transactions_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(transactions_json.count).to eq 2

    end
  end
  describe '#find_all params invoice_id' do
    it "responds OK" do
      Customer.create(
                      id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(
                      id: 1,
                      name: "Target"
                      )
      Invoice.create(
                     id: 1,
                     customer_id: 1,
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

      get :find_all, format: :json, id: Transaction, invoice_id: 1

      transaction_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(transaction_json.count).to eq 2

    end
  end
  describe '#find_all params credit_card_number' do
    it "responds OK" do
      Customer.create(
                      id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(
                      id: 1,
                      name: "Target"
                      )
      Invoice.create(
                     id: 1,
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      Transaction.create(
                         invoice_id: 1,
                         credit_card_number: "123456789",
                         result: "success"
                         )

      get :find_all, format: :json, id: Transaction, credit_card_number: "123456789"

      transactions_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(transactions_json.count).to eq 1

    end
  end
  describe '#random' do
    it "responds OK" do
      Customer.create(
                      id: 1,
                      first_name: "Joe",
                      last_name:  "Sampson"
                      )
      Merchant.create(
                      id: 1,
                      name: "Target"
                      )
      Invoice.create(
                     id: 1,
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped"
                     )

      Transaction.create(
                         invoice_id: 1,
                         credit_card_number: "123456789",
                         result: "success"
                         )


      get :random, format: :json

      transactions_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(transactions_json.count).to eq 1
      expect(transactions_json.first[:invoice_id]).to eq 1

    end
  end
end
