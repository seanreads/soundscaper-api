class Soundscape < ApplicationRecord
  acts_as_taggable_on :trends, :keywords
  validates :name, :country, :woeid, presence: true
  validate :trends_cannot_be_empty

  def trends_cannot_be_empty
    errors.add(:trend_list, "can't be empty") if self.trend_list.empty? 
  end

  def self.create_from_trends_available
    # ISSUE: Twitter::Error::TooManyRequests: Rate limit exceeded
    # SOLUTION: Batch them - do ~25 at a time
    twitter = ::Api::Twitter::Base.new.client
    locations = twitter.trends_available
    record_count = 0
    locations.each do |location|
      # For a maximum of 25 locations, if location does not yet have a soundscape for
      # 'today', create a soundscape
      soundscape = Soundscape.where('name = ? AND created_at > ?', location.name, 1.day.ago)
      if !soundscape.present?
        trends = ::Api::Twitter::Formatter.join_trends(twitter.trends(location.woeid))
        record = Soundscape.create(name: location.name) do |soundscape|
          soundscape.woeid = location.woeid
          soundscape.country = location.country
          soundscape.trend_list = trends
        end
        record_count +=1 if record
        break if record_count >= 25 # TODO: Put maximum record count into config
      end
    end    
  end

end
