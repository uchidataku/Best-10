# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ItemsController, type: :request do
  let(:account) { create(:account) }
  let(:headers) { { Authorization: "Bearer #{account.jwt}" } }

  describe 'POST /rankings/:ranking_id/items' do
    subject(:request) { post ranking_items_path(ranking.id), params: params, headers: headers }
    let(:params) { { item: { name: 'ターミネーター', description: 'ハリウッド映画' } } }
    let!(:ranking) { create(:ranking) }

    it 'Itemを作成できる' do
      expect { request }.to change(Item, :count).by(+1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PATCH /items/:id' do
    subject(:request) { patch item_path(item.id), params: params, headers: headers }
    let!(:item) { create(:item, :with_image, account: target_account) }
    let(:params) { { item: { name: 'ターミネーター', description: 'ハリウッド映画' } } }

    context '自分のItem' do
      let(:target_account) { account }

      it 'Itemを更新できる' do
        request
        expect(response).to have_http_status(:ok)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['name']).to eq 'ターミネーター'
      end
    end

    context '他人のItem' do
      let(:target_account) { create(:account) }

      it 'Itemを更新できない' do
        request
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'DELETE /items/:id' do
    subject(:request) { delete item_path(item.id), headers: headers }
    let!(:item) { create(:item, account: target_account) }

    context '自分のItem' do
      let(:target_account) { account }

      it 'Itemを削除できる' do
        expect { request }.to change(Item, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context '他人のItem' do
      let(:target_account) { create(:account) }

      it 'Itemを削除できない' do
        request
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
