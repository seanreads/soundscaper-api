require 'rails_helper'

describe ::Api::Twitter::Base do

  before (:all) do
    @twitter = ::Api::Twitter::Base.new.client
  end

  context 'Twitter trends' do
    # let!(:soundscape) { create(:soundcape) }
    it 'finds all trend locations' do
      VCR.use_cassette('twitter_trend_locations') do
        trend_locations = @twitter.trend_locations
        expect(trend_locations).to be_an(Array)
        expect(trend_locations.first).to be_a(Twitter::Place)
      end
    end
    it 'finds trends given a trend location' do
      VCR.use_cassette('twitter_trends_from_trend_location') do
        trend_locations = @twitter.trend_locations
        trends = @twitter.trends(trend_locations.first.woeid)
        expect(trends).to be_a Twitter::TrendResults
      end
    end
    it 'finds trends given an available trend' do
      VCR.use_cassette('twitter_trends_from_available_trends') do
        trends_available = @twitter.trends_available
        trends = @twitter.trends(trends_available.first.woeid)
        expect(trends).to be_a Twitter::TrendResults
      end
    end
  end

end
