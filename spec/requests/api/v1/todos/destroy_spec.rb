require 'rails_helper'

RSpec.describe 'DELETE /api/v1/todos/:id', type: :request do
  let(:url) { "/api/v1/todos/#{todo.id}" }
  let(:headers) { { 'X-USER-TOKEN' => user_token, 'X-USER-EMAIL' => user_email } }
  let(:user) { create(:user) }
  let(:user_token) { user.authentication_token }
  let(:user_email) { user.email }
  let(:todo) {
    create(:todo,
           user: user)
  }

  before do
    delete url, params: {}, headers: headers
  end

  context 'when user is authorized' do
    it { expect(response).to have_http_status(:no_content) }
  end

  context 'when user is not authorized' do
    let(:user_token) { 'invalid-token' }

    it { expect(response).to have_http_status(:unauthorized) }
  end
end
