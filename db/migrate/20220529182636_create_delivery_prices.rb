class CreateDeliveryPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_prices do |t|
      t.float :volume
      t.float :weight
      t.float :km_price

      t.timestamps
    end
  end
end
