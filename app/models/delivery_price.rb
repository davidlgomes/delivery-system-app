class DeliveryPrice < ApplicationRecord
    validates :volume, :weight, :km_price, :name, :initial_price, presence: true
    validates :name, uniqueness:true
end
