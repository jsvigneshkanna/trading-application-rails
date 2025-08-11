FactoryBot.define do
    factory :crypto_price do
      instrument_name { "BTC-USDT" }
      price { rand(30000.0..50000.0).round(6) }
      timestamp { Time.zone.now }
    end
  end

  