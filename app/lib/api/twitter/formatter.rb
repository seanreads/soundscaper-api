module Api
  module Twitter
    class Formatter

      def self.join_trends(trends)
        trends.attrs[:trends].collect{|trend| trend[:name]}.join(',')
      end

    end
  end
end
