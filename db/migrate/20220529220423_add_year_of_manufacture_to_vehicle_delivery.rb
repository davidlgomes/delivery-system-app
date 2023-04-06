class AddYearOfManufactureToVehicleDelivery < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicle_deliveries, :year_of_manufacture, :integer
  end
end
