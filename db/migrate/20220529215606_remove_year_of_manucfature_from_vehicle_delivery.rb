class RemoveYearOfManucfatureFromVehicleDelivery < ActiveRecord::Migration[7.0]
  def change
    remove_column :vehicle_deliveries, :year_of_manucfature, :string
  end
end
