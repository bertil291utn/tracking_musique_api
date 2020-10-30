require 'rails_helper'

RSpec.describe 'Stats', type: :request do
  let(:stat) { create :stat }

  describe 'should show a stat' do
    before { get "/api/v1/stats/#{stat.id}" }
    it { expect(response).to have_http_status(:success) }

    let(:json_response) { JSON.parse(response.body) }
    it { expect(json_response['hours']).to match(stat.hours) }
    it { expect(json_response['day']).to match(Time.now.utc.strftime('%A').downcase) }
  end

  describe 'should show stats' do
    before { get '/api/v1/stats' }
    it { expect(response).to have_http_status(:success) }
  end
end
