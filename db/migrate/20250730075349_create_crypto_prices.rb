class CreateCryptoPrices < ActiveRecord::Migration[8.0]
  def change
    create_table :crypto_prices do |t|
      t.string :instrument_name
      t.decimal :price
      t.timestamp :timestamp

      t.timestamps
    end
  end
end
