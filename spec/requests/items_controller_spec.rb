# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ItemsController, type: :request do
  let(:account) { create(:account) }
  let(:headers) { { Authorization: "Bearer #{account.jwt}" } }

  describe 'POST /rankings/:ranking_id/items' do
    subject(:request) { post ranking_items_path(ranking.id), params: params, headers: headers }
    let(:params) { { item: { name: 'ターミネーター' } } }
    let!(:ranking) { create(:ranking) }

    it 'Itemを作成できる' do
      expect { request }.to change(Item, :count).by(+1)
      expect(response).to have_http_status(:created)
    end
  end
end
