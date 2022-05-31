class CarrierManagement < ApplicationRecord
    has_many :vehicle_deliveries
    has_many :delivery_price
    has_many :deadline
    enum status: {inactive: 0, active: 1}
    validates :fancy_name, :social_reason, :domain_of_emails, :cnpj, :billing_address, presence: true
    validates :cnpj, length:{is:14}
    validates :fancy_name, :social_reason, :domain_of_emails, :cnpj, uniqueness:true
    validates :cnpj, :cnpj => true
end
