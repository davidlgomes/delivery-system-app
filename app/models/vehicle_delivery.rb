class VehicleDelivery < ApplicationRecord
    belongs_to :carrier_management
    validates :vehicle_plate, :brand_vehicle, :model_vehicle, :year_of_manufacture, :maximum_load_capacity, :carrier_management_id, presence: true
    validates :vehicle_plate, length:{is:7}
    validates :vehicle_plate, uniqueness:true
end
