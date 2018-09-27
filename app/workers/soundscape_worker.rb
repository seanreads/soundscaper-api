class SoundscapeWorker
  include Sidekiq::Worker

  def perform(*args)
    # TODO/SEAN: Move this into model
    # ISSUE: Exceeds requests, so move to individually created, user-initiated from UI
    twitter = ::Api::Twitter::Base.new.client
    locations = twitter.trend_locations
    locations.each do |location|
      trends = ::Api::Twitter::Formatter.join_trends(twitter.trends(location.woeid))
      Soundscape.create(name: location.name) do |soundscape|
        soundscape.woeid = location.woeid
        soundscape.country = location.country
        soundscape.trend_list = trends
      end
    end
  end
end
