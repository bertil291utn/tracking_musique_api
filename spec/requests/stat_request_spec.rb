require 'rails_helper'

RSpec.describe 'Stats', type: :request do
  let(:stat) { create :stat }
  let(:userId) { stat.artist.user_id }
  let(:params_stat) {
    {
      stat: {
        hours: stat.hours,
        track_name: stat.track_name,
        artist_id: stat.artist.id,
        spotify_track_id: stat.spotify_track_id,
      },
    }
  }
  let(:headers) { { Authorization: JsonWebToken.encode(user_id: userId) } }

  describe 'should show a stat' do
    before { get "/api/v1/stats/#{stat.id}" }
    it { expect(response).to have_http_status(:success) }

    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
    it { expect(json_response.dig(:data, :attributes, :hours)).to match(stat.hours) }
    it { expect(json_response.dig(:data, :attributes, :track_name)).to match(stat.track_name) }
    it { expect(json_response.dig(:data, :attributes, :spotify_track_id)).to match(stat.spotify_track_id) }
    it { expect(json_response.dig(:data, :attributes, :day)).to match(Time.now.utc.strftime('%A').downcase) }
  end

  describe 'should show stats' do
    before { get '/api/v1/stats' }
    it { expect(response).to have_http_status(:success) }
  end

  describe 'should create a stat' do
    before { post '/api/v1/stats', params: params_stat, headers: headers }
    it { expect(response).to have_http_status(:created) }
  end

  describe 'should forfid create a stat' do
    before { post '/api/v1/stats', params: params_stat }
    it { expect(response).to have_http_status(:forbidden) }
  end
end
