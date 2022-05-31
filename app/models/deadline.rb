class Deadline < ApplicationRecord
    belongs_to :carrier_management
    validates :minimum_distance,:maximum_distance, :minimum_of_days,:days_delivery, presence: true
end
