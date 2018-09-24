require 'rails_helper'

describe ::Api::Freesound::Base do

  before (:all) do
    @freesound = ::Api::Freesound::Base.new.conn
  end

  context 'Freesound' do
    it 'finds sounds matching a keyword query' do
      VCR.use_cassette('freesound_keyword_search') do
        keyword = 'dog'
        response = @freesound.get('apiv2/search/text/', query: keyword)
        results = JSON.parse(response.body)['results']
        expect(results[0]['tags']).to include(keyword)
      end
    end
  end

end
