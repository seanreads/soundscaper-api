require 'rails_helper'

RSpec.describe "Soundscapes", type: :request do
  describe "GET /api/v1/soundscapes" do
    let!(:soundscapes) { FactoryBot.create_list(:soundscape, 3) }
    it "gets all soundscapes" do
      get api_v1_soundscapes_path
      body = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(body['data'].length).to eq(3)
    end
  end
end
