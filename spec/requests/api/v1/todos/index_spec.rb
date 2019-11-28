require 'rails_helper'

RSpec.describe 'GET /api/v1/todos', type: :request do
  let(:url) { '/api/v1/todos' }
  let(:headers) { { 'X-USER-TOKEN' => user_token, 'X-USER-EMAIL' => user_email } }
  let(:user) { create(:user) }
  let(:user_token) { user.authentication_token }
  let(:user_email) { user.email }

  before do
    create(:todo,
           user: user,
           title: 'work',
           description: 'SimpleDeploy',
           status: false)

    get(url, params: {}, headers: headers)
  end

  context 'when user is authorized' do
    it { expect(response).to have_http_status(:success) }
    it { expect(json_body[:items].size).to eq(1) }
    it { expect(json_body[:items].first[:title]).to eq('work') }
    it { expect(json_body[:items].first[:description]).to eq('SimpleDeploy') }
    it { expect(json_body[:items].first[:status]).to eq(false) }
  end

  context 'when user is not authorized' do
    let(:user_token) { 'invalid-token' }

    it { expect(response).to have_http_status(:unauthorized) }
  end
end
