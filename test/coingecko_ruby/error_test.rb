require 'test_helper'

class TestError < Minitest::Test
  # ClientErrorStatuses = (400...451).freeze
  ClientErrorStatuses = (400...401).freeze
  # ServerErrorStatuses = (500...511).freeze
  ServerErrorStatuses = (500...501).freeze

  def setup
    @client = CoingeckoRuby::Client.new
  end

  def test_that_it_rescues_exceptions_from_faraday_and_wraps_it_correctly
    ClientErrorStatuses.each do |status|
      assert_raises Faraday::Error do
        body = { key: 'Server Error' }.to_s
        stub_get('stubbed_endpoint').to_return(status: status, body: body, headers: { content_type: 'application/json; charset=utf-8' })
        @client.get('stubbed_endpoint')
      end
    end
  end
end
