# frozen_string_literal: true
# AccountsController
class AccountsController < ApplicationController
  load_and_authorize_resource :account

  def show
    render json: @account, include: [rankings: :items]
  end
end
