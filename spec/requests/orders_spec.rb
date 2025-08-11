require 'rails_helper'

RSpec.describe "Orders API", type: :request do
  describe "GET /orders" do
    it "returns all orders" do
      create_list(:order_book, 3)
      get "/orders"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST /orders" do
    it "creates a new order with valid data" do
      post "/orders", params: {
        instrument_name: "BTC-USDT",
        quantity: 2.0,
        order_type: "market"
      }

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["instrument_name"]).to eq("BTC-USDT")
    end

    it "fails to create order with invalid data" do
      post "/orders", params: {
        instrument_name: "BTC-USDT",
        order_type: "market"
      }
    
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET /orders/:id (status filter)" do
    it "returns orders with status 'open'" do
      create(:order_book, status: "open")
      get "/orders/open"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).first["status"]).to eq("open")
    end
  end

  describe "PUT /orders/:id" do
    it "updates the order status" do
      order = create(:order_book, status: "open")
      put "/orders/#{order.id}", params: { status: "accepted" }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["status"]).to eq("accepted")
    end
  end

  describe "DELETE /orders/:id" do
    it "deletes the order" do
      order = create(:order_book)
      delete "/orders/#{order.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["message"]).to include("successfully deleted")
    end
  end
end
