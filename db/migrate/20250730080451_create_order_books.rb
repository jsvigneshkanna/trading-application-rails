class CreateOrderBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :order_books do |t|
      t.string :instrument_name
      t.decimal :quantity
      t.string :order_type
      t.string :status, default: "open"

      t.timestamps
    end
  end
end
