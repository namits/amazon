require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Product' do
    it 'fetch products' do
      expect ( Product.fetch_products.count ).should be > 0
    end

    it 'save products' do
      expect ( Product.save_fetch_records.count ).should be > 0
    end

  end
end



