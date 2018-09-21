module Api
  module Twitter
    class Base

      def initialize(opts={})

        p ENV['TWITTER_CONSUMER_KEY']
        p ENV['TWITTER_CONSUMER_SECRET']
        p ENV['TWITTER_ACCESS_TOKEN']
        p ENV['TWITTER_ACCESS_TOKEN_SECRET']

        @client = ::Twitter::REST::Client.new do |config|
          config.consumer_key         = ENV['TWITTER_CONSUMER_KEY']
          config.consumer_secret      = ENV['TWITTER_CONSUMER_SECRET']
          config.access_token         = ENV['TWITTER_ACCESS_TOKEN']
          config.access_token_secret  = ENV['TWITTER_ACCESS_TOKEN_SECRET']
        end
      end

    end
  end
end
