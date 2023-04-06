class CreatePriceQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :price_queries do |t|
      t.float :volume_query
      t.float :weight_query
      t.float :distance_query
      t.float :delivery_price_query
      t.string :carrier_disponible

      t.timestamps
    end
  end
end
