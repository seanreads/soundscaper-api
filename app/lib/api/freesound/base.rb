module Api
  module Freesound
    class Base

      attr_reader :conn

      def initialize(opts={})
        @conn = Faraday::Connection.new(ENV['FREESOUND_API']) do |conn|
          conn.params[:token] = ENV['FREESOUND_CLIENT_SECRET_API_KEY']
          conn.adapter(Faraday.default_adapter)
        end
      end

    end
  end
end
