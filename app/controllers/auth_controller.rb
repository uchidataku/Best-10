# frozen_string_literal: true
# AuthController
class AuthController < ApplicationController
  skip_before_action :authenticate_account!

  def sign_in
    account = Account.find_by(username: resource_params[:username]).try(:authenticate, resource_params[:password])
    fail Errors::UnauthorizedError if account.blank?

    render json: account, serializer: AccountWithTokenSerializer
  end

  def sign_up
    if Account.all.pluck(:username).include?(resource_params[:username])
      fail ActionController::ParameterMissing, '入力されたユーザーネームは既に使用されています'
    end

    @account = Account.create!(resource_params)
    render json: @account, status: :created, serializer: AccountWithTokenSerializer
  end

  private

  def resource_params
    params.require(:account).permit(:username, :password)
  end
end
