class AddLargerWeightToDeliveryPrices < ActiveRecord::Migration[7.0]
  def change
    add_column :delivery_prices, :larger_weight, :float
  end
end
