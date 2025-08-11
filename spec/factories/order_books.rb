FactoryBot.define do
    factory :order_book do
      instrument_name { "BTC-USDT" }
      quantity { 1.5 }
      order_type { "market" }
      status { "open" }
    end
  end