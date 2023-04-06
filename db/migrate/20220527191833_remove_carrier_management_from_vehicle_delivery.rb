class RemoveCarrierManagementFromVehicleDelivery < ActiveRecord::Migration[7.0]
  def change
    remove_column :vehicle_deliveries, :carrier_management, :string
  end
end
