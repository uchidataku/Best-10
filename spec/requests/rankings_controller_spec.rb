# frozen_string_literal: true
require 'rails_helper'

RSpec.describe RankingsController, type: :request do
  let(:account) { create(:account) }
  let(:headers) { { Authorization: "Bearer #{account.jwt}" } }

  def committee_options
    @committee_options ||= { schema_path: Rails.root.join('openapi', 'Spec.yml').to_s }
  end

  describe 'GET /rankings' do
    subject(:request) { get rankings_path, headers: headers }
    let!(:rankings) { create_list(:ranking, 3) }

    it 'Ranking一覧を取得できる' do
      request
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['rankings'].count).to eq 3
    end

    it 'Response OK' do
      request
      assert_response_schema_confirm
    end
  end

  describe 'POST /rankings' do
    subject(:request) { post rankings_path, params: params, headers: headers }
    let(:params) { { ranking: { title: '好きな映画', genre: Ranking::Genre::ENTERTAINMENT } } }

    it 'Rankingを作成できる' do
      expect { request }.to change(Ranking, :count).by(+1)
      expect(response).to have_http_status(:created)
    end

    it 'Response OK' do
      request
      assert_response_schema_confirm
    end
  end

  describe 'GET /rankings/:id' do
    subject(:request) { get ranking_path(ranking.id), headers: headers }
    let(:ranking) { create(:ranking) }
    let!(:items) { create_list(:item, 3, ranking: ranking) }

    it 'Rankingを取得できる' do
      request
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['id']).to eq ranking.id
    end

    it 'Response OK' do
      request
      assert_response_schema_confirm
    end
  end
end
