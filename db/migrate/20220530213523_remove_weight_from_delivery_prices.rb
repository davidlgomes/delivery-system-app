class RemoveWeightFromDeliveryPrices < ActiveRecord::Migration[7.0]
  def change
    remove_column :delivery_prices, :weight, :string
  end
end
