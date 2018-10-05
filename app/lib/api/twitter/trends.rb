module Api
  module Twitter
    class Trends < Base

      def trend_locations
        @client.trend_locations
      end

      def trends_by_location(woeid)
        @client.trends(woeid)
      end

    end
  end
end
