require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:merchant) do
    merchant = Merchant.create(id: 1,
                    name: "Target")

  end

  it "creates an merchant" do
    merchant.save

    expect(Merchant.all.first.id).to eq(merchant.id)
    expect(Merchant.all.first.name).to eq("Target")
  end
end
