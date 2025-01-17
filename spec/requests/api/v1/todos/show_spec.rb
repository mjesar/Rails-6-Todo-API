require 'rails_helper'

RSpec.describe 'GET /api/v1/todos/:id', type: :request do
  let(:url) { "/api/v1/todos/#{todo.id}" }
  let(:headers) { { 'X-USER-TOKEN' => user_token, 'X-USER-EMAIL' => user_email } }
  let(:user) { create(:user) }
  let(:user_token) { user.authentication_token }
  let(:user_email) { user.email }
  let(:todo) {
    create(:todo,
           user: user,
           title: 'work',
           description: 'SimpleDeploy',
           status: false)
  }

  before do
    get(url, headers: headers, as: :json)
  end

  context 'when user is authorized' do
    it { expect(response).to have_http_status(:success) }
    it { expect(json_body[:title]).to eq('work') }
    it { expect(json_body[:description]).to eq('SimpleDeploy') }
    it { expect(json_body[:status]).to eq(false) }
  end

  context 'when user is not authorized' do
    let(:user_token) { 'invalid-token' }

    it { expect(response).to have_http_status(:unauthorized) }
  end
end
