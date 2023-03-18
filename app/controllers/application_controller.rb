# frozen_string_literal: true
# ApplicationController
class ApplicationController < ActionController::API
  include ExceptionHandler
  include EnvelopeRenderer

  before_action :authenticate_account!
  before_action :load_viewer_context!

  serialization_scope :context

  attr_reader :current_account, :context

  def current_ability
    @current_ability ||= current_account ? Ability.new(current_account) : Ability.new
  end

  private

  def authenticate_account!
    @current_jwt = /Bearer (.*)/.match(request.headers[:Authorization]).to_a[1]
    return if @current_jwt.blank?

    @current_account = Account.authenticate!(@current_jwt)
  end

  def load_viewer_context!
    @context = { current_account: current_account, current_ability: current_ability }
  end
end
