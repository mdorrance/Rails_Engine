require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:user) do
    Customer.new(first_name: "Jane",
             last_name:  "Doe")
  end

  it "creates a user" do
    user.save

    expect(Customer.all.first.first_name).to eq("Jane")
    expect(Customer.all.first.last_name).to eq("Doe")
  end
end
