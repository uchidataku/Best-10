# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AccountsController, type: :request do
  let(:account) { create(:account) }
  let(:headers) { { Authorization: "Bearer #{account.jwt}" } }

  describe 'GET /accounts/:id' do
    subject(:request) { get account_path(account.id), headers: headers }

    it 'Accountを取得できる' do
      request
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['id']).to eq account.id
    end

    it 'Response OK' do
      request
      assert_response_schema_confirm(200)
    end
  end
end
