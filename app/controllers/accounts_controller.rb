# frozen_string_literal: true
# AccountsController
class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
    render json: @account
  end
end
