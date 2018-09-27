module Api
  module V1
    class SoundscapesController < ApplicationController

      def index
        # @soundscapes = Soundscape.all
        # render json: SoundscapeSerializer.new(@soundscapes).serializable_hash, status: :ok
        # @locations = ::Api::Base::
        # ISSUE/SEAN: Should client be initialized once in the application config intializer?
        # ISSUE/SEAN: Need to cache trend_locations to avoid exceeding Twitter limit
        client = ::Api::Twitter::Trends.new
        locations = client.trend_locations
      end

      def create
      end

    end
  end
end
