class Api::V1::ServicesController < ApplicationController
  before_action :check_api_token

  def region
    render json: {code: 404, message: 'Records not found'}, status: 404 and return unless params[:region].present?
    products = Product.select(:service_code, :sku, :from_location).where(from_location: params[:region])
    total_products = params[:date].present? ? products.where("DATE(created_at) = ? ", params[:date].to_date) : products
    render json: total_products, status: 200
  end

end