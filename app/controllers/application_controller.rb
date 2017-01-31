class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :json

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { :error => exception.message }, :status => 422
  end

  def not_found
    render json: {error: "not-found"}.to_json, status: 404
  end
end
