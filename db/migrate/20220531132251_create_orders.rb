class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :full_address
      t.string :product_code
      t.float :volume
      t.float :weight

      t.timestamps
    end
  end
end
