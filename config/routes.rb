Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#demand_pricing'

  namespace :api do
    namespace :v1 do
      get '/service/AmazonCloudFront/region/:region', to: 'services#region'
    end
  end
end