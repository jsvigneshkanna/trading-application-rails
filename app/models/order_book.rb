class OrderBook < ApplicationRecord
    validates :instrument_name, presence: true, inclusion: { in: ["BTC-USDT", "ETH-USDT", "XRP-USDT"]}
    validates :quantity, presence: true, numericality: { greater_than: 0 }
    validates :order_type, inclusion: { in: ["market"] }
end
