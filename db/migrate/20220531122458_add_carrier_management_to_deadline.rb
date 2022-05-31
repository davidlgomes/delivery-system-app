class AddCarrierManagementToDeadline < ActiveRecord::Migration[7.0]
  def change
    add_reference :deadlines, :carrier_management, null: false, foreign_key: true
  end
end
