class Product < ApplicationRecord

  def self.fetch_products
    item_lists = AmazonCloudFrontApi.fetch_data
    item_lists["products"].collect {|product, attribute| OpenStruct.new(attribute["attributes"].merge!({sku: attribute['sku'], productFamily: attribute['productFamily']})) } if item_lists.present?
  end

  def self.save_fetch_records
    begin
      products = Product.fetch_products
      products.each do |fetched_product|
        product = Product.new
        product.sku = fetched_product.sku
        product.product_family = fetched_product.productFamily
        product.service_code   = fetched_product.servicecode
        product.transfer_type  = fetched_product.transferType
        product.from_location  = fetched_product.fromLocation
        product.save
      end
    rescue Exception => e
      puts "#{e.message}"
    end
  end
end
