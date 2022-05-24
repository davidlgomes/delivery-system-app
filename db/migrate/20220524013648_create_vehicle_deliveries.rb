class CreateVehicleDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_deliveries do |t|
      t.string :vehicle_plate
      t.string :brand_vehicle
      t.string :model_vehicle
      t.string :year_of_manucfature
      t.string :maximum_load_capacity

      t.timestamps
    end
  end
end
