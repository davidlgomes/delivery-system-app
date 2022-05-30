class AddNameOfferAndInitialPriceToDeliveryPrices < ActiveRecord::Migration[7.0]
  def change
    add_column :delivery_prices, :name, :string
    add_column :delivery_prices, :initial_price, :float
  end
end
