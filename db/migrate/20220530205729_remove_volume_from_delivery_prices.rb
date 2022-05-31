class RemoveVolumeFromDeliveryPrices < ActiveRecord::Migration[7.0]
  def change
    remove_column :delivery_prices, :volume, :string
  end
end
