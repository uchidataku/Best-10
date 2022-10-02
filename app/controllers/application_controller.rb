# frozen_string_literal: true
# ApplicationController
class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authenticate_account!

  serialization_scope :current_account

  attr_reader :current_account

  private

  def authenticate_account!
    @current_jwt = /Bearer (.*)/.match(request.headers[:Authorization]).to_a[1]
    @current_account = Account.authenticate!(@current_jwt)
  end
end
