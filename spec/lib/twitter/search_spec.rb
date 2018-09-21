require 'rails_helper'

describe ::Api::Twitter::Base do

  context 'Twitter trends' do
    # let!(:soundscape) { create(:soundcape) }
    it 'finds all trend locations' do
      VCR.use_cassette('twitter_trend_locations') do
        twitter = ::Api::Twitter::Base.new.client
        response = twitter.trend_locations
        expect(response.length).to be > 0
      end
    end
  end

end
