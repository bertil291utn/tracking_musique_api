require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:usuario) { create :user }
  describe 'should show user' do
    it 'returns success as http status response' do
      get "/api/v1/users/#{usuario.id}"
      expect(response).to have_http_status(:success)
    end

    it 'equal to email' do
      get "/api/v1/users/#{usuario.id}"
      json_response = JSON.parse(response.body)
      expect(json_response['email']).to match(usuario.email)
    end
  end

  describe 'create user' do
    it 'returns success as http status response ' do
      post '/api/v1/users', params: { user: { name: 'newuser', email: 'new@email.com', password: 'password' } }
      expect(response).to have_http_status(:created)
    end

    it 'returns unprocessale entity' do
      post '/api/v1/users', params: { user: { name: usuario.name, email: usuario.email, password: usuario.password_digest } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
