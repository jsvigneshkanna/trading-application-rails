require 'rails_helper'

RSpec.describe CryptoPrice, type: :model do
  it "has a valid factory" do
    expect(build(:crypto_price)).to be_valid
  end

  it "can be saved to the database" do
    expect { create(:crypto_price) }.to change(CryptoPrice, :count).by(1)
  end

  it "stores the instrument name correctly" do
    price = create(:crypto_price, instrument_name: "ETH-USDT")
    expect(price.instrument_name).to eq("ETH-USDT")
  end

  it "stores price with precision" do
    price = create(:crypto_price, price: 42156.12345678)
    expect(price.price.to_f).to be_within(0.000001).of(42156.12345678)
  end

  it "stores timestamp correctly" do
    time = Time.zone.now
    price = create(:crypto_price, timestamp: time)
    expect(price.timestamp.to_i).to eq(time.to_i)
  end
end
