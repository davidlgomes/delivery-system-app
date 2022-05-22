class CreateCarrierManagements < ActiveRecord::Migration[7.0]
  def change
    create_table :carrier_managements do |t|
      t.string :fancy_name
      t.string :social_reason
      t.string :domain_of_emails
      t.string :cnpj
      t.string :billing_address

      t.timestamps
    end
  end
end
