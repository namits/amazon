class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :product_family
      t.string :service_code
      t.string :transfer_type
      t.string :from_location
      t.string :from_location_type
      t.string :to_location
      t.string :to_location_type
      t.string :usage_type
      t.string :operation
      t.string :service_name
      t.timestamps
    end
  end
end
