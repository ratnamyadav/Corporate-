class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :destroy_session
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_filter :check_auth

  # respond_to :json
  
  def not_found
    return api_error(status: 404, errors: 'Not found')
  end

  def destroy_session
    request.session_options[:skip] = true 
  end

  def formatted_error_messages(object)
    object.errors.keys.each_with_object({}) {|key, h| h[key] = object.errors[key]}
  end

  def current_user_language_preference
    current_user.language_preference || 'english'
  end

  def check_auth
    if request.headers['Authorization'] != 'c54fe0b6a252921423acc1ebe24febed'
      render json: {
          error: 'Unauthorized Access'
      }, status: 401
      return
    end
  end

end