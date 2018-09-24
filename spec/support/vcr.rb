RSpec.configure do |config|
  config.before(:suite) do
    VCR.configure do |c|
      c.hook_into :webmock
      c.cassette_library_dir = 'spec/support/cassettes'
      c.configure_rspec_metadata!
      c.default_cassette_options = { record: :once, match_requests_on: [:host] }
      c.allow_http_connections_when_no_cassette = true
    end
  end
end
