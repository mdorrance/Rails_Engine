require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) do
    Merchant.create(id: 1,
                    name: "Target")
    item = Item.new(
               name: "Pants",
               description: "Long",
               unit_price: 12.34,
               merchant_id: 1)
  end

  it "creates an item" do
    item.save

    expect(Item.all.first.id).to eq(item.id)
    expect(Item.all.first.name).to eq("Pants")
    expect(Item.all.first.merchant_id).to eq(1)
    expect(Item.all.first.unit_price).to eq(12.34)
  end
end
