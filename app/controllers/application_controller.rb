class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_api_token
    api_token = request.headers["X-Parse-REST-API-Key"]
    render json: {error: "invalid_api_key", status: 403 }, status: 403 if api_token.blank? || !(API_TOKEN == api_token)
  end
end
