# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


CryptoPrice.create(
    [
        { instrument_name: "BTC-USDT", price: 41928.12345678, timestamp: Time.zone.parse("2025-07-30 11:45:00") },
        { instrument_name: "ETH-USDT", price: 2345.67890123, timestamp: Time.zone.parse("2025-07-30 11:45:00") },
        { instrument_name: "BTC-USDT", price: 41950.11112222, timestamp: Time.zone.parse("2025-07-30 11:46:00") },
        { instrument_name: "ETH-USDT", price: 2350.00001234, timestamp: Time.zone.parse("2025-07-30 11:46:00") },
        { instrument_name: "BTC-USDT", price: 41895.98765432, timestamp: Time.zone.parse("2025-07-30 11:47:00") },
        { instrument_name: "XRP-USDT", price: 11895.98765432, timestamp: Time.zone.parse("2025-07-30 11:47:00") },
        { instrument_name: "XRP-USDT", price: 11890.98765432, timestamp: Time.zone.parse("2025-07-30 11:46:00") }
    ]
)