class CryptoPrice < ApplicationRecord
    validates :instrument_name, presence: true, inclusion: { in:  ["BTC-USDT", "ETH-USDT", "XRP-USDT"] }
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :timestamp, presence: true
  end
  