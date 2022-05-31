class AddCarrierManagementToDeliveryPrices < ActiveRecord::Migration[7.0]
  def change
    add_reference :delivery_prices, :carrier_management, null: false, foreign_key: true, default: 0
  end
end
