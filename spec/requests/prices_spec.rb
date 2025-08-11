require 'rails_helper'

RSpec.describe "Prices API", type: :request do
  describe "GET /prices" do
    it "returns all crypto prices" do
      create_list(:crypto_price, 3)
      get "/prices"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "GET /prices/:instrument_name" do
    it "returns latest price for given instrument" do
      create(:crypto_price, instrument_name: "BTC-USDT", price: 45000)
      get "/prices/BTC-USDT"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["instrument_name"]).to eq("BTC-USDT")
    end
  end

  describe "PUT /prices/:instrument_name" do
    it "updates price for a given instrument" do
      create(:crypto_price, instrument_name: "BTC-USDT", price: 42000)
      put "/prices/BTC-USDT", params: { price: 46000 }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["price"]).to eq("46000.0")
    end

    it "fails if instrument doesn't exist" do
      put "/prices/NON-EXISTENT", params: { price: 9999 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
