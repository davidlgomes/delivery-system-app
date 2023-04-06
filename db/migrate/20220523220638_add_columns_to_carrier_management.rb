class AddColumnsToCarrierManagement < ActiveRecord::Migration[7.0]
  def change
    add_column :carrier_managements, :carrier_situation, :string
  end
end
