require 'rails_helper'

RSpec.describe Soundscape, type: :model do
  let!(:soundscape) { build(:soundscape) }
  before(:all) do
    @twitter = ::Api::Twitter::Base.new.client
  end
  it "creates a soundscape from a Twitter trending location" do
    VCR.use_cassette('twitter_trend_locations_and_trend_for_soundscape') do
      location = @twitter.trend_locations[1]
      trends = @twitter.trends(location.woeid)
      soundscape.name = location.name
      soundscape.woeid = location.woeid
      soundscape.country = location.country
      # TODO/SEAN: Encapsulate >>>
      soundscape.trend_list = trends.attrs[:trends].collect{|trend| trend[:name]}.join(',')
      # <<<
      soundscape.save
      expect(soundscape).to be_a(Soundscape)
      expect(soundscape).to be_valid
    end
  end
  it "updates a soundscape from Twitter trending location" do
    # TODO/SEAN: Write test
  end

end
