class AddStatusToCarrierManagement < ActiveRecord::Migration[7.0]
  def change
    add_column :carrier_managements, :status, :integer, default: 0
  end
end
