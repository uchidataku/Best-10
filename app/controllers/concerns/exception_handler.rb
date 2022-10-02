# frozen_string_literal: true
# 例外対応
module ExceptionHandler
  extend ActiveSupport::Concern
  included do
    # 500
    rescue_from StandardError do |e|
      Rails.logger.fatal e.full_message
      json_response(
        { errors: [{ description: e.message, status: 500, error_code: nil }] }, :internal_server_error
      )
    end

    # 401
    rescue_from JWT::DecodeError do
      json_response(
        { errors: [{ description: 'Unauthorized', status: 401, error_code: nil }] }, :unauthorized
      )
    end

    rescue_from Errors::UnauthorizedError do
      json_response(
        { errors: [{ description: 'ユーザーネームまたはパスワードが正しくありません', status: 401, error_code: nil }] },
        :unauthorized
      )
    end

    # 404
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response(
        { errors: [{ description: e.message, status: 404, error_code: nil }] }, :not_found
      )
    end

    # 422
    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response(
        { errors: [{ description: e.message, status: 422, error_code: nil }] }, :unprocessable_entity
      )
    end

    rescue_from ActionController::ParameterMissing do |e|
      json_response(
        { errors: [{ description: e.param, status: 422, error_code: nil }] }, :unprocessable_entity
      )
    end

    def json_response(obj, status = :ok)
      render json: obj, status: status
    end
  end
end
