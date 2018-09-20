require 'rails_helper'

include Rails.application.routes.url_helpers
RSpec.describe "Soundscapes", type: :request do
  describe "GET /soundscapes" do
    let!(:soundscapes) { FactoryBot.create_list(:soundscape, 3) }
    it "should return soundscapes" do
      get '/soundscapes'
      body = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(body['data'].length).to eq(3)
    end
  end
end
