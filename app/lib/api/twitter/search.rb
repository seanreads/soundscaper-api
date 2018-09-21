module Api
  module Twitter
    class Search < Base

    def search(query)
      @client.home_timeline
    end

    end
  end
end
