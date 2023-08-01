# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  ERROR_CODES = {
    internal_server_error: 500,
    unprocessable_entity: 422,
    not_acceptable: 406,
    not_found: 404
  }.freeze

  ERROR_MESSAGES = {
    internal_server_error: 'Internal Server Error',
    unprocessable_entity: 'Something went wrong',
    not_acceptable: 'Already Exist',
    not_found: 'Record Not Found'
  }.freeze

  included do
    rescue_from StandardError, with: :handle_internal_server_error
    rescue_from ErrorHandler::CustomError, with: :handle_custom_error
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
    rescue_from ActiveRecord::RecordNotUnique, with: :handle_not_acceptable
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  end

  class CustomError < StandardError
    attr_reader :status, :code, :message

    def initialize(status = :unprocessable_entity, code = 422, message = 'Something went wrong')
      @status = status
      @code = code
      @message = message
      super()
    end
  end

  private

  def handle_internal_server_error(exception)
    respond(:internal_server_error, exception)
  end

  def handle_custom_error(exception)
    respond(exception.status, exception)
  end

  def handle_record_invalid(exception)
    flat_messages = exception&.record&.errors&.messages&.transform_values { |v| v.join(', ') }
    respond(:unprocessable_entity, exception, errors: flat_messages || exception.message)
  end
end
