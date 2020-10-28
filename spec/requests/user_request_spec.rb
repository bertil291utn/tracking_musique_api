require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:usuario) { create :user }
  describe 'should show user' do
    before { get "/api/v1/users/#{usuario.id}" }
    it { expect(response).to have_http_status(:success) }

    let(:json_response) { JSON.parse(response.body) }
    it { expect(json_response['email']).to match(usuario.email) }
  end

  describe 'create user' do
    before { post '/api/v1/users', params: { user: { name: 'newuser', email: 'new@email.com', password: 'password' } } }
    it { expect(response).to have_http_status(:created) }

    context 'existed email' do
      before { post '/api/v1/users', params: { user: { name: usuario.name, email: usuario.email, password: usuario.password_digest } } }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
