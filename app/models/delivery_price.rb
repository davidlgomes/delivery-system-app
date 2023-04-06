class DeliveryPrice < ApplicationRecord
    belongs_to :carrier_management
    validates :smaller_volume, :larger_volume, :smaller_weight, :larger_weight, :km_price, :name, :initial_price, presence: true
    validates :name, uniqueness:true
end
