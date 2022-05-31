class AddSmallerWeightToDeliveryPrices < ActiveRecord::Migration[7.0]
  def change
    add_column :delivery_prices, :smaller_weight, :float
  end
end
