require 'rails_helper'

include Rails.application.routes.url_helpers
RSpec.describe "Soundscapes", type: :request do
  describe "GET /soundscapes" do
    let!(:soundscapes) { FactoryBot.create_list(:soundscape, 3) }
    it "should return soundscapes" do
      get '/soundscapes'
      expect(response).to have_http_status(200)
    end
  end
end
