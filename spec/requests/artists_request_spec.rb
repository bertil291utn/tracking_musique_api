require 'rails_helper'

RSpec.describe 'Artists', type: :request do
  let(:artist) { create :artist }
  let(:userId) { artist.user_id }
  let(:params_artist) { { artist: { id_string: artist.id_string } } }
  let(:headers) { { Authorization: JsonWebToken.encode(user_id: userId) } }

  describe 'should show an artist' do
    before { get "/api/v1/artists/#{artist.id}" }
    it { expect(response).to have_http_status(:success) }

    let(:json_response) { JSON.parse(response.body) }
    it { expect(json_response['id_string']).to match(artist.id_string) }
  end

  describe 'should display artists' do
    before { get '/api/v1/artists' }
    it { expect(response).to have_http_status(:success) }
  end

  describe 'should create an artist' do
    before { post '/api/v1/artists', params: params_artist, headers: headers }
    it { expect(response).to have_http_status(:created) }
  end

  describe 'should not create a artist' do
    let(:userId) { 1000 }
    before { post '/api/v1/artists', params: params_artist, headers: headers }
    it { expect(response).to have_http_status(:forbidden) }
  end

  describe 'should update artist' do
    before { put "/api/v1/artists/#{artist.id}", params: params_artist, headers: headers }
    it { expect(response).to have_http_status(:success) }
  end

  describe 'should not update artist' do
    let(:usuario) { create :user }
    let(:userId) { usuario.id }
    before { put "/api/v1/artists/#{artist.id}", params: params_artist, headers: headers }
    it { expect(response).to have_http_status(:forbidden) }
  end

  describe 'should destroy a artist' do
    before { delete "/api/v1/artists/#{artist.id}", headers: headers }
    it { expect(response).to have_http_status(:no_content) }
  end

  describe 'should forbid destroy a artist' do
    let(:usuario) { create :user }
    let(:userId) { usuario.id }
    before { delete "/api/v1/artists/#{artist.id}", headers: headers }
    it { expect(response).to have_http_status(:forbidden) }
  end
end