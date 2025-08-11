require 'rails_helper'

RSpec.describe OrderBook, type: :model do
  it "has a valid factory" do
    expect(build(:order_book)).to be_valid
  end

  it "can be saved to the database" do
    expect { create(:order_book) }.to change(OrderBook, :count).by(1)
  end

  it "defaults to status 'open'" do
    order = create(:order_book)
    expect(order.status).to eq("open")
  end

  it "is invalid with unsupported instrument_name" do
    order = build(:order_book, instrument_name: "DOGE-USDT")
    expect(order).not_to be_valid
    expect(order.errors[:instrument_name]).to include("is not included in the list")
  end

end


